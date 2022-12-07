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
        return "redirect:/admin/category-list";
    }

//    @RequestMapping("/category")
//    public String testCategory(){
//        return "/admin/view/list-category";
//    }
}
