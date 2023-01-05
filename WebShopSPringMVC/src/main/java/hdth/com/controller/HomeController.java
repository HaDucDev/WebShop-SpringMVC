package hdth.com.controller;


import hdth.com.model.Order;
import hdth.com.service.OrderService;
import hdth.com.service.PaymentMomoService;
import hdth.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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




    @RequestMapping("/admin/index")
    public String admin(HttpSession session, Model model){
        model.addAttribute("currentUser",session.getAttribute("currentUser"));
        return "admin/index";
    }

    @RequestMapping("/admin/statistical")
    public String adminstatistical(){
        return "admin/d-statistical";
    }


//    @Autowired
//    private MomoConfig momoConfig;
//    @PostMapping("/test/api/momo")
//    @ResponseBody
//    public ResponseEntity<CaptureMoMoResponse> testMomo(@RequestBody MoMoObject moMoObject) throws Exception {
//        return
//        ResponseEntity.ok(this.momoConfig.process(moMoObject.getA(), moMoObject.getB(),
//                moMoObject.getC(), moMoObject.getD(),
//                moMoObject.getE(), moMoObject.getF(), moMoObject.getG()));
//    }



}
