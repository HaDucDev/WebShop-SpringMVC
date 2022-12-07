package hdth.com.controller;


import hdth.com.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupplierController {


    @Autowired
    private SupplierService supplierService;

    @GetMapping("/admin/supplier-list")
    private String getSupplier(Model model){
        model.addAttribute("supplierList",this.supplierService.getSuppliers());
        return "/admin/a-list-supplier";
    }
}
