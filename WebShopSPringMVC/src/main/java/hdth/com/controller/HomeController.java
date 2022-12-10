package hdth.com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {



    @GetMapping("/login")
    public String index(){
        return "user/login";
    }


    @RequestMapping("/salespolicy")
    public String salespolicy(){
        return "user/salespolicy";
    }
    @RequestMapping("/map")
    public String map(){//trang lien he
        return "user/map";
    }

    @RequestMapping("/")
    public String index99(){
        return "user/index";
    }


    @RequestMapping("/admin")
    public String admin(HttpSession session, Model model){
        model.addAttribute("currentUser",session.getAttribute("currentUser"));
        return "admin/index";
    }


}
