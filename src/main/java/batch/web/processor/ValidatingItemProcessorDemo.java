package batch.web.processor;

import batch.web.entity.User;
import org.springframework.batch.item.validator.ValidatingItemProcessor;
import org.springframework.batch.item.validator.ValidationException;
import org.springframework.stereotype.Component;

/**
 * @author kris
 */
@Component
public class ValidatingItemProcessorDemo {


    private ValidatingItemProcessor<User> validatingItemProcessor() {
        ValidatingItemProcessor<User> processor = new ValidatingItemProcessor<>();
        processor.setValidator(value -> {
            // 对每一条数据进行校验
            if ("".equals(value.getId())) {
                // 如果field3的值为空串，则抛异常
                throw new ValidationException("field3的值不合法");
            }
        });
        return processor;
    }
}
