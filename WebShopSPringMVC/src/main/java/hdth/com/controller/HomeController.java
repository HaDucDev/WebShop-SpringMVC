package hdth.com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

//    @RequestMapping("/")
//    public String index(){
//        return "index";
//    }


    @RequestMapping("/")
    public String index(){
        return "user/index";
    }

    @RequestMapping("/salespolicy")
    public String salespolicy(){
        return "user/salespolicy";
    }
    @RequestMapping("/map")
    public String map(){//trang lien he
        return "user/map";
    }

//    @RequestMapping("/category")
//    public String testCategory(){
//        return "/admin/view/list-category";
//    }
}
