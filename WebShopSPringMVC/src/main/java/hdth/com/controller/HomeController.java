package hdth.com.controller;


import hdth.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {


    @Autowired
    private ProductService productService;

    @RequestMapping("/")
    public String index99(Model model){
        model.addAttribute("productListHome", this.productService.getProducts());
        return "user/index";
    }


    @GetMapping("/login")
    public String index(){
        return "user/login";
    }


    @RequestMapping("/salespolicy")
    public String salespolicy(){
        return "user/a-salespolicy";
    }
    @RequestMapping("/map")
    public String map(){//trang lien he
        return "user/a-map";
    }




    @RequestMapping("/admin")
    public String admin(HttpSession session, Model model){
        model.addAttribute("currentUser",session.getAttribute("currentUser"));
        return "admin/index";
    }


}
