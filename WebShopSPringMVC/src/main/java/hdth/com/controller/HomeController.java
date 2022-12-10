package hdth.com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

//    @RequestMapping("/")
//    public String index(){
//        return "index";
//    }


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
        return "user/test";
    }


    @RequestMapping("/admin")
    public String admin(){
        return "admin/index";
    }


}
