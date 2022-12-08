package hdth.com.controller;


import hdth.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/admin/product-list")
    private String getSupplier(Model model) {
        model.addAttribute("productList", this.productService.getProducts());
        System.out.println(this.productService.getProducts().get(3).getProductstatus().getName());
        return "/admin/a-list-product";
    }
}
