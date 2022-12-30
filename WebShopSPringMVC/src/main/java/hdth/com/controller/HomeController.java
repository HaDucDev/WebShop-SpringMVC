package hdth.com.controller;


import com.mservice.allinone.models.CaptureMoMoResponse;
import com.mservice.shared.sharedmodels.Environment;
import hdth.com.config.paymentMoMo.MomoConfig;
import hdth.com.config.paymentMoMo.PaymentResult;
import hdth.com.controller.dtotestmomo.MoMoHungDuLieu1;
import hdth.com.controller.dtotestmomo.MoMoObject;
import hdth.com.service.ProductService;
import hdth.com.utils.dto.PayGateResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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


    @Autowired
    private MomoConfig momoConfig;
    @PostMapping("/test/api/momo")
    @ResponseBody
    public ResponseEntity<CaptureMoMoResponse> testMomo(@RequestBody MoMoObject moMoObject) throws Exception {
        return
        ResponseEntity.ok(this.momoConfig.process(moMoObject.getA(), moMoObject.getB(),
                moMoObject.getC(), moMoObject.getD(),
                moMoObject.getE(), moMoObject.getF(), moMoObject.getG()));
    }


    @GetMapping("/test/api/momo")
    public String testMomo1() throws Exception {
        return "/user/a-map";
    }


    @PostMapping(value = "/will/api/momo/api", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public void testMomo2(PayGateResponse payGateResponse) throws Exception {
        Environment environment = Environment.selectEnv("dev", Environment.ProcessType.PAY_GATE);
        payGateResponse = PaymentResult.process(environment,new PayGateResponse());
        System.out.println(payGateResponse.getMessage());
    }


}
