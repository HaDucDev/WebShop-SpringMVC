package hdth.com.controller;

import hdth.com.model.User;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class UserController {

    @Autowired
    private UserService userDetailsService;

    //========================> Common
    //register

    @GetMapping("/register")
    public String indexregister(Model model){
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping("/register")
    private String register(@ModelAttribute User user,Model model){
        String error= "";
        if(this.userDetailsService.addOrUpdateUsers(user)==true)
        {
            String mess="Chúc mừng bạn đã đăng kí thành công";
            model.addAttribute("successregister",mess);
            return "user/login";//forward:/login
        }
        else  error="da co loi";
        model.addAttribute("errorregister",error);
        return "user/register";
    }



    //========================> Admin

    @GetMapping("/admin/user-list")
    private String getSupplier(Model model) {
        model.addAttribute("userList", this.userDetailsService.getUsers());
        return "/admin/a-list-user";
    }
}
