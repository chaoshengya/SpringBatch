package batch.web.writer;


import batch.web.entity.User;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.database.BeanPropertyItemSqlParameterSourceProvider;
import org.springframework.batch.item.database.JdbcBatchItemWriter;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * @author kris
 */
@Component
public class JdbcItemWriterDemo {

    @Resource
    private DataSource dataSource;

    public ItemWriter<User> dataSourceItemWriter() {
        // ItemWriter的实现类之一，mysql数据库数据写入使用JdbcBatchItemWriter，
        // 其他实现：MongoItemWriter,Neo4jItemWriter等
        JdbcBatchItemWriter<User> writer = new JdbcBatchItemWriter<>();
        writer.setDataSource(dataSource); // 设置数据源

        String sql = "insert into user_to(id,name) values (:id,:name)";
        writer.setSql(sql); // 设置插入sql脚本

        // 映射TestData对象属性到占位符中的属性
        BeanPropertyItemSqlParameterSourceProvider<User> provider = new BeanPropertyItemSqlParameterSourceProvider<>();
        writer.setItemSqlParameterSourceProvider(provider);

        writer.afterPropertiesSet(); // 设置一些额外属性
        return writer;
    }
}
