package hdth.com.config.springSecurity;

import hdth.com.config.handlerUser.LoginSuccessHandler;
import hdth.com.config.handlerUser.LogoutHandler;
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
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "hdth.com.service",
        "hdth.com.repository"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {



    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;

    @Autowired
    private LogoutSuccessHandler logoutHandler;


    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler(){
        return new LoginSuccessHandler();
    }



    @Bean
    public LogoutSuccessHandler logoutHandler(){
        return new LogoutHandler();
    }



    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password");



       // http.formLogin().defaultSuccessUrl("/admin").failureUrl("/login?error");
        http.formLogin().failureUrl("/login?error");
        http.formLogin().successHandler(this.loginSuccessHandler);// dang nhap thanh cong

        //phan biet quyen dc phep truy cap hay ko. neu khong dc tro ve trang login va bao loi
        http.exceptionHandling().accessDeniedPage("/login?accessDenied");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");
//        http.authorizeRequests().antMatchers("/").permitAll()
//                .antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER')");

//        http.authorizeRequests().antMatchers("/").permitAll()
//                .antMatchers("/user/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER')");

        //http.logout().logoutSuccessUrl("/");
        http.logout().logoutSuccessHandler(this.logoutHandler);// dang xuat thanh cong

        http.csrf().disable();
    }

}
