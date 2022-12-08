package hdth.com.config;


import hdth.com.utils.formatter.CategoryFomatter;
import hdth.com.utils.formatter.ProducStatusFormatter;
import hdth.com.utils.formatter.SupplierFormatter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;




@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "hdth.com.controller",
        "hdth.com.service",
        "hdth.com.repository"
})
public class WebApplicationContextConfig implements WebMvcConfigurer {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new CategoryFomatter());
        registry.addFormatter(new SupplierFormatter());
        registry.addFormatter(new ProducStatusFormatter());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
        registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
        registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/resources/admin/");
        registry.addResourceHandler("/user/**").addResourceLocations("/resources/user/");
    }

    @Bean
    public InternalResourceViewResolver geInternalResourceViewResolver() {
        InternalResourceViewResolver resourceView = new InternalResourceViewResolver();
        resourceView.setViewClass(JstlView.class);
        resourceView.setPrefix("/WEB-INF/jsp/");
        resourceView.setSuffix(".jsp");
        return resourceView;
    }


}
