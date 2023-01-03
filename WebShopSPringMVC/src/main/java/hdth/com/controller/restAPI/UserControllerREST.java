package hdth.com.controller.restAPI;

import hdth.com.model.User;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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


//    @GetMapping("/data-user")
//    public ResponseEntity<UserResponse> getUserOK(HttpServletRequest request){
//        HttpSession httpSession= request.getSession();
//        User user = (User) httpSession.getAttribute("currentUser");
//        System.out.println("123456");
//        UserResponse userResponse = new UserResponse();
//        userResponse.setFullName(user.getFullName());
//        userResponse.setEmail(user.getEmail());
//        userResponse.setAddressDefault(user.getAddressDefault());
//        userResponse.setPhone(user.getPhone());
//        if (user!=null){
//            System.out.println("654321");
//            System.out.println(user);
//           return new ResponseEntity<>(userResponse, HttpStatus.OK) ;
//        }
//        return new ResponseEntity<>(null, HttpStatus.CREATED) ;
//    }
        @GetMapping("/data-user")
    public ResponseEntity<User> getUserOK(HttpServletRequest request){
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        System.out.println("123456");
//        UserResponse userResponse = new UserResponse();
//        userResponse.setFullName(user.getFullName());
//        userResponse.setEmail(user.getEmail());
//        userResponse.setAddressDefault(user.getAddressDefault());
//        userResponse.setPhone(user.getPhone());
        if (user!=null){
            System.out.println("654321");
            System.out.println(user);
           return new ResponseEntity<>(user, HttpStatus.OK) ;
        }
        return new ResponseEntity<>(null, HttpStatus.CREATED) ;
    }


    // change password
    @PutMapping ("/user/account-manager-password")
    public ResponseEntity<Integer> changePasswordByUser(@RequestBody User changePasswordRequest) {
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
