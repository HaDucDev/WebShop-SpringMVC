package hdth.com.controller.restAPI;

import com.sun.security.auth.UserPrincipal;
import hdth.com.model.User;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@RestController
public class UserControllerREST {

    //USER
    @Autowired
    private UserService userDetailsService;


    @GetMapping("/user/account-user")
    public ResponseEntity<?> getUserOK(Authentication authentication) {
        User user = this.userDetailsService.getUsersByUsername(authentication.getName()).get(0);
        System.out.println("123456");
        if (user != null) {
            System.out.println("654321");
            System.out.println(user);
            return new ResponseEntity<>(user, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }


    // change password
    @PutMapping("/user/account-manager-password")
    public ResponseEntity<Integer> changePasswordByUser(@RequestBody User changePasswordRequest) {
        System.out.println(changePasswordRequest.getOldPassword());
        System.out.println(changePasswordRequest.getNewPassword());
        if (this.userDetailsService.changePassword(changePasswordRequest) == true) {
            System.out.println("1");
            return new ResponseEntity<>(1, HttpStatus.OK);
        }
        System.out.println("0");
        return new ResponseEntity<>(0, HttpStatus.CREATED);// chi tra ve trang thai thoi
    }
}
