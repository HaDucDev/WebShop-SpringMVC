package hdth.com.controller.restAPI;

import hdth.com.model.User;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class UserControllerREST {

    //USER
    @Autowired
    private UserService userDetailsService;

    // change password
    @PutMapping ("/user/account-manager-password")
    private ResponseEntity<Integer> changePasswordByUser(@RequestBody User changePasswordRequest) {
        System.out.println(changePasswordRequest.getOldPassword());
        System.out.println(changePasswordRequest.getNewPassword());
        if (this.userDetailsService.changePassword(changePasswordRequest)==true){
            System.out.println("1");
            return new ResponseEntity<>(1, HttpStatus.OK) ;
        }
        System.out.println("0");
        return new ResponseEntity<>(0, HttpStatus.CREATED) ;// chi tra ve trang thai thoi
    }
}
