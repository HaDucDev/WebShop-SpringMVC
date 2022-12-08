package hdth.com.controller;


import hdth.com.model.Category;
import hdth.com.model.Supplier;
import hdth.com.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SupplierController {


    @Autowired
    private SupplierService supplierService;

    @GetMapping("/admin/supplier-list")
    private String getSupplier(Model model) {
        model.addAttribute("supplierList", this.supplierService.getSuppliers());
        return "/admin/a-list-supplier";
    }

    @GetMapping("/admin/supplier/add")
    private String getAdd(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "admin/b-add-supplier";
    }

    @PostMapping("/admin/supplier/add")
    private String addOrUpdateSuppliers(@ModelAttribute Supplier supplier, Model model) {
//        if(this.categoryService.addOrUpdateCategories(category)==true){
//            return "redirect:/admin/category-list";
//        }
//        else{// them that bai
//            model.addAttribute("msg","Them bi loi roi. hay thu lai sau");
//            if (category.getId()==null){
//                return "admin/b-add-category";
//            }
//        }
//        model.addAttribute("iderror",category.getId());// lay id
//        return "forward:/admin/category/edit/{id}";// chuyen tiep nhung du lieu id van con neu truong hop loi
//    }
        System.out.println(supplier.getSupplierName());
        System.out.println(supplier.getFile());
        if (this.supplierService.addOrUpdateSuppliers(supplier) == true)
        {
            return "redirect:/admin/supplier-list"; // redirect:/template tức là chuyển đến controller khác đấy. nhưng cái này nó lại quét
        }
        else model.addAttribute("msg", "Them bi loi roi. hay thu lai sau");
        return "redirect:/admin/supplier/add";// quet urlResolver xong roi den InternalView va cai nay se vo InternalView
    }
}
