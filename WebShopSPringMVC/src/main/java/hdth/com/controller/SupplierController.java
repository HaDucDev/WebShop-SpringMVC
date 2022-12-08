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

    @GetMapping(path = "/admin/supllier/edit/{id}")
    private String getEdit(@PathVariable(name = "id") Integer id, Model model){

        model.addAttribute("supplier",this.supplierService.getSupplierById(id));
        return "admin/c-edit-supplier";
    }

    @PostMapping("/admin/supplier/add")
    private String addOrUpdateSuppliers(@ModelAttribute Supplier supplier, Model model) {
        System.out.println(supplier.getSupplierName());
        System.out.println(supplier.getFile());
        if (this.supplierService.addOrUpdateSuppliers(supplier) == true)
        {
            return "redirect:/admin/supplier-list"; // redirect:/template tức là chuyển đến controller khác đấy. nhưng cái này nó lại quét
        }
        else model.addAttribute("msg", "Them bi loi roi. hay thu lai sau");
        return "redirect:/admin/supplier-list";// quet urlResolver xong roi den InternalView va cai nay se vo InternalView
    }

    @GetMapping("/admin/supplier/delete/{id}")
    private String deleteCategorybyId(@PathVariable("id") Integer id,Model model){
        if(this.supplierService.deleteSupplierById(id)==false){
            model.addAttribute("msg","Xoa bi loi roi. hay thu lai sau");
        }
        return "redirect:/admin/supplier-list";
    }
}
