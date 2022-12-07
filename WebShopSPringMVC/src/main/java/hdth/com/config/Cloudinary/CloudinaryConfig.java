package hdth.com.config.Cloudinary;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CloudinaryConfig {

    @Bean
    public Cloudinary cloudinary(){
        Cloudinary c= new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dyatpgcxn",
                "api_key", "187783315185776",
                "api_secret", "UiFG83kSy726gj8qS55oYHTxOTI",
                "secure", true
        ));
        return c;
    }

}
