package hdth.com.config.handlerUser;

import hdth.com.model.User;
import hdth.com.service.UserService;
import hdth.com.utils.enums.ERole;
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
        StringBuffer url = httpServletRequest.getRequestURL();
        String contextPath = httpServletRequest.getContextPath();
        // Tìm vị trí của context path trong URL
        int contextPathIndex = url.indexOf(contextPath) + contextPath.length();
        url.setLength(contextPathIndex);// lay gia tri tu dau den ki tu dau tien cua context path
        if(user.getRole().getName().equals(ERole.ROLE_ADMIN)){
            url.append("/admin/index");
//            httpServletResponse.sendRedirect("/WebShopSPringMVC_war/admin/index");
//            httpServletRequest.getRequestDispatcher("/admin").forward(httpServletRequest,httpServletResponse);
        }
//        if(user.getRole().getName().equals(ERole.ROLE_USER)){
//            httpServletResponse.sendRedirect("/WebShopSPringMVC_war");
//        }
        httpServletResponse.sendRedirect(url.toString());
    }
}
