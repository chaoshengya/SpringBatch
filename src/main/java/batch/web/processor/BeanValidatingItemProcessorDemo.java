package batch.web.processor;

import batch.web.entity.User;
import org.springframework.batch.item.validator.BeanValidatingItemProcessor;
import org.springframework.stereotype.Component;

/**
 * @author kris
 */
@Component
public class BeanValidatingItemProcessorDemo {

    private BeanValidatingItemProcessor<User> beanValidatingItemProcessor() throws Exception {
        BeanValidatingItemProcessor<User> beanValidatingItemProcessor = new BeanValidatingItemProcessor<>();
        // 开启过滤，不符合规则的数据被过滤掉；
        beanValidatingItemProcessor.setFilter(true);
        beanValidatingItemProcessor.afterPropertiesSet();
        return beanValidatingItemProcessor;
    }
}
