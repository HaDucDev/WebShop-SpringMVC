package hdth.com.config.springSecurity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "hdth.com.service",
        "hdth.com.repository"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {



//    @Bean
//    public UserDetailsService userDetailsService() {
//        return super.userDetailsService();
//    }


    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password");
        http.formLogin().defaultSuccessUrl("/admin").failureUrl("/login?error");

        //phan biet quyen dc phep truy cap hay ko. neu khong dc tro ve trang login va bao loi
        http.exceptionHandling().accessDeniedPage("/login?accessDenied");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");



        http.logout().logoutSuccessUrl("/");

        http.csrf().disable();
    }

}
