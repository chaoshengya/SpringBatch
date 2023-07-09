package batch.web.job;


import batch.web.entity.User;
import batch.web.reader.JdbcItemReaderDemo;
import batch.web.writer.JdbcItemWriterDemo;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author kris
 */
@Component
public class DataSourceItemJob {

    @Resource
    private JobBuilderFactory jobBuilderFactory;
    @Resource
    private StepBuilderFactory stepBuilderFactory;

    @Resource
    private JdbcItemReaderDemo jdbcItemReaderDemo;
    @Resource
    private JdbcItemWriterDemo jdbcItemWriterDemo;


    @Bean
    public Job dataSourceItemReaderJob() throws Exception {
        return jobBuilderFactory.get("job111")
                .start(step())
                .build();
    }

    private Step step() throws Exception {
        return stepBuilderFactory.get("step")
                .<User, User>chunk(2)
                .reader(jdbcItemReaderDemo.dataSourceItemReader())
                .writer(jdbcItemWriterDemo.dataSourceItemWriter())
                .build();
    }

}
