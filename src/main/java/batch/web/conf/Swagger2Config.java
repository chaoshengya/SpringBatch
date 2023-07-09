package batch.web.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kris
 * @date 2023/7/7 3:38 PM
 */
@Configuration
@EnableSwagger2
public class Swagger2Config {

    @Bean
    public Docket createRestApi() {
        List<Parameter> pars = new ArrayList<>();
        ParameterBuilder builder = new ParameterBuilder()
                .modelRef(new ModelRef("string"))
                .parameterType("header")
                .required(false);
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                // swagger不支持"*"通配符
                .apis(RequestHandlerSelectors.basePackage("batch.web"))
                .paths(PathSelectors.any())
                .build()
                .globalOperationParameters(pars);
    }

    private ApiInfo apiInfo() {
        Contact contact = new Contact("chaoshengya", "http://localhost:8080", "");
        return new ApiInfoBuilder()
                .title("springbatch批处理")
                .description("同步平台")
                .termsOfServiceUrl("http://localhost:8080")
                .contact(contact)
                .version("1.0")
                .build();
    }

}
