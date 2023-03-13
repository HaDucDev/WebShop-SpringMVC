package hdth.com.config.sendMail;


import org.apache.commons.mail.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;


import javax.mail.MessagingException;

@Configuration
@PropertySource("classpath:database.properties")
public class EmailService {

    @Autowired
    private Environment env;

    public void sendEmail(String toEmail, String subject, String message) throws EmailException, MessagingException {
        //Email email = new SimpleEmail();
        HtmlEmail email = new HtmlEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(587);
        email.setAuthenticator(new DefaultAuthenticator(env.getProperty("spring.mail.username"), env.getProperty("spring.mail.password")));
        email.setStartTLSEnabled(true);
        email.setFrom(env.getProperty("spring.mail.username"));
        email.setSubject(subject);
        //email.setMsg(message);
        email.setHtmlMsg(message);
        email.setCharset("utf-8"); // thiết lập encoding
        email.addTo(toEmail);
        email.send();
    }
}
