package hdth.com.controller;


import hdth.com.model.Product;
import hdth.com.service.CategoryService;
import hdth.com.service.ProductService;
import hdth.com.service.ProductStatusService;
import hdth.com.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@ControllerAdvice
public class ProductController {

    @Autowired
    private ProductService productService;

//    @Autowired
//    private CategoryService categoryService;
//
//    @Autowired
//    private SupplierService supplierService;

    @Autowired
    private ProductStatusService productStatusService;


    @GetMapping("/admin/product-list")
    private String getProducts(Model model) {
        model.addAttribute("productList", this.productService.getProducts());
        System.out.println(this.productService.getProducts().get(3).getProductstatus().getName());
        return "/admin/a-list-product";
    }

//    @GetMapping("/admin/product-list-pagination")
//    private String getProductsPagination(Model model, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "8") int size) {
//        Pageable pageable = PageRequest.of(page, size);
//        Page<Product> productList = this.productService.getProductsPagination(pageable);
//        model.addAttribute("productsPage", productList);
//        return "/admin/a-list-product";
//    }

    @GetMapping("/admin/product/add")
    private String getAdd(Model model) {
          model.addAttribute("product", new Product());
//        model.addAttribute("categoryList",this.categoryService.getCategories());
//        model.addAttribute("supplierList",this.supplierService.getSuppliers());
//        model.addAttribute("productStatusList",this.productStatusService.getProductStatuses());
        return "admin/b-add-product";
    }


    @PostMapping("/admin/product/add")
    private String addOrUpdateProducts(@ModelAttribute Product product, Model model) {

        System.out.println(product.getSupplier().getId());
        if (this.productService.addOrUpdateProducts(product)==true)
        {
            return "redirect:/admin/product-list"; // redirect:/template tức là chuyển đến controller khác đấy. nhưng cái này nó lại quét
        }
        else model.addAttribute("msg", "Them bi loi roi. hay thu lai sau");
        return "redirect:/admin/product-list";// quet urlResolver xong roi den InternalView va cai nay se vo InternalView
    }


    @GetMapping(path = "/admin/product/edit/{id}")
    private String getEdit(@PathVariable(name = "id") Integer id, Model model){

        model.addAttribute("product",this.productService.getProductById(id));
        return "admin/c-edit-product";
    }

    //================> common
    @ModelAttribute
    public void commonAtrr(Model model){// dung chung cho admin thoi, CHUC NANG ADD PRODUCT
        model.addAttribute("productStatusList",this.productStatusService.getProductStatuses());
    }



    //================>USER
    @GetMapping(path = "/product/{id}")// khong dang nhap cung xem duoc san pham chi tiet
    private String getProductDetail(@PathVariable(name = "id") Integer id, Model model){
        model.addAttribute("productDetail",this.productService.getProductById(id));
        return "user/product-details";
    }



}
