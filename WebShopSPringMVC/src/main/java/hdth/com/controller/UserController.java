package hdth.com.controller;

import hdth.com.model.User;
import hdth.com.service.CartService;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userDetailsService;

    @Autowired
    private CartService cartService;

    //==========================================================================================================> Common
    //register

    @GetMapping("/register")
    public String indexregister(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping("/register")
    private String register(@ModelAttribute User user, Model model) {
        String error = "";
        if (this.userDetailsService.addOrUpdateUsers(user) == true) {
            String mess = "Chúc mừng bạn đã đăng kí thành công";
            model.addAttribute("successregister", mess);
            return "user/login";
        } else error = "da co loi";
        model.addAttribute("errorregister", error);
        return "user/register";
    }

    // forget password
    @GetMapping("/forget-pass")
    public String indexForgetPass() {
        return "user/forgetPassword";
    }
    //post email. dung jsp sevet, ko dung spring form
    @PostMapping("/forget-pass")
    public String postEmail(@RequestParam("email") String email, Model model) {// model ơ day la dung cho form xac nhan, hung thi la jsp servlet

        if(this.userDetailsService.cofirmPassword(email)==true){// xac nhan va gui email
            //tao doi tuong va gui sang form xac nhan ma
            User user = new User();
            user.setEmail(email);//dat lai  gia tri dung
            model.addAttribute("userForget", user);
            return "user/confirmForgetPass";// nguoi dung se nhap ma o trang nay
        }
        String mess = "Lỗi";
        model.addAttribute("errorEmail",mess);
        return "user/forgetPassword";
    }

    //post de xac nha doi9 mat khau
    @PostMapping("/forget-pass-confirm")
    public String postConfirmForget(@ModelAttribute User user, Model model) {// model ơ day la dung cho form xac nhan, hung thi la jsp servlet
//        if(this.userDetailsService.getUserByEmail(email)==null){
//            String mess = "Lỗi";
//            model.addAttribute("errorEmail",mess);
//            return "user/forgetPassword";
//        }
        //tao doi tuong va gui sang form xac nhan ma
        model.addAttribute("userForget", user);
        return "user/confirmForgetPass";
    }

    // so luong san pham co trong gio nguoi dung sau khi dang nhap
    @ModelAttribute
    public void commonAtrr(Model model, HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if (user != null) {
            System.out.println("00000000000000000000000000");
            model.addAttribute("cartCounter", this.cartService.countProductCartbyUser(user.getId()));
            System.out.println(this.cartService.countProductCartbyUser(user.getId()));
        } else model.addAttribute("cartCounter", 0);
    }


    //=================================================================================================================================> Admin

    @GetMapping("/admin/user-list")
    private String getSupplier(Model model) {
        model.addAttribute("userList", this.userDetailsService.getUsers());
        return "/admin/a-list-user";
    }


    //====================================================================================================================================> USER
    @GetMapping("/user/account-manager")
    private String getUserByUser(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("currentUser");
        if ( user != null) {
            Integer userId= user.getId();
            model.addAttribute("userinfor", this.userDetailsService.getUserById(userId));
        }
        return "/user/inforUser";
    }



    @PostMapping("/user/account-manager")
    private String EditUserByUser(@ModelAttribute User user, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User usercurrent= (User) session.getAttribute("currentUser");
        if ( user != null && usercurrent !=null) {
            //User x= this.userDetailsService.getUserById(usercurrent.getId());
            //model.addAttribute("userinfor", this.userDetailsService.getUserById(userId));
        }
        return "/user/inforUser";
    }



}
