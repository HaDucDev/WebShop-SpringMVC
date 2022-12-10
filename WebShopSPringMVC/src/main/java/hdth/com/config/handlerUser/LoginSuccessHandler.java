package hdth.com.config.handlerUser;

import hdth.com.model.User;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                        Authentication authentication) throws IOException, ServletException {

        User user = this.userDetailsService.getUsersByUsername(authentication.getName()).get(0);

        HttpSession session=httpServletRequest.getSession();
        session.setAttribute("currentUser",user);
        httpServletResponse.sendRedirect("/WebShopSPringMVC_war/admin");
    }
}
