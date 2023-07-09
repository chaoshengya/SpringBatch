package batch.web.reader;

import batch.web.entity.User;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.database.JdbcPagingItemReader;
import org.springframework.batch.item.database.Order;
import org.springframework.batch.item.database.support.MySqlPagingQueryProvider;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author kris
 */
@Component
public class JdbcItemReaderDemo {

    @Resource
    private DataSource dataSource;

    public ItemReader<User> dataSourceItemReader() throws Exception {
        JdbcPagingItemReader<User> reader = new JdbcPagingItemReader<>();
        reader.setDataSource(dataSource); // 设置数据源
        reader.setFetchSize(5); // 每次取多少条记录
        reader.setPageSize(5); // 设置每页数据量

        // 指定sql查询语句 select id,field1,field2,field3 from TEST
        MySqlPagingQueryProvider provider = new MySqlPagingQueryProvider();
        provider.setSelectClause("id,name"); //设置查询字段
        provider.setFromClause("from user"); // 设置从哪张表查询

        // 将读取到的数据转换为TestData对象
        reader.setRowMapper((resultSet, rowNum) -> {
            User data = new User();
            data.setId(resultSet.getString(1));
            data.setName(resultSet.getString(2)); // 读取第一个字段，类型为String
            return data;
        });

        Map<String, Order> sort = new HashMap<>(1);
        sort.put("id", Order.ASCENDING);
        provider.setSortKeys(sort); // 设置排序,通过id 升序

        reader.setQueryProvider(provider);

        // 设置namedParameterJdbcTemplate等属性
        reader.afterPropertiesSet();
        return reader;
    }
}
