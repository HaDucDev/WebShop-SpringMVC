package hdth.com.controller;


import hdth.com.model.Category;
import hdth.com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.persistence.criteria.CriteriaBuilder;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/admin/category-list")
    private String getCategorys(Model model){
        model.addAttribute("cateList",this.categoryService.getCategories());
        return "admin/a-list-category";
    }

    @GetMapping("/admin/category/add")
    private String getAdd(Model model){
        model.addAttribute("cateList",new Category());
        return "admin/b-add-category";
    }


    @GetMapping(path = "/admin/category/edit/{id}")
    private String getEdit(@PathVariable(name = "id") Integer id, Model model){
        if(model.getAttribute("iderror") !=null){// lay id cua cate them va sua khong dc neu co. cai hay hi huu
            Integer iderror=Integer.parseInt(model.getAttribute("iderror").toString());
            model.addAttribute("cateList",this.categoryService.getCategoryById(iderror));
            return "admin/c-edit-category";
        }
        model.addAttribute("cateList",this.categoryService.getCategoryById(id));
        return "admin/c-edit-category";
    }


    @PostMapping("/admin/category/add")
    private String addOrUpdateCategories(@ModelAttribute Category category,Model model){
        if(this.categoryService.addOrUpdateCategories(category)==true){
            return "redirect:/admin/category-list";
        }
        else{// them that bai
            model.addAttribute("msg","Them bi loi roi. hay thu lai sau");
            if (category.getId()==null){
                return "admin/b-add-category";
            }
        }
        model.addAttribute("iderror",category.getId());// lay id
        return "forward:/admin/category/edit/{id}";// chuyen tiep nhung du lieu id van con neu truong hop loi
    }

    @GetMapping("/admin/category/delete/{id}")
    private String deleteCategorybyId(@PathVariable("id") Integer id,Model model){
        if(this.categoryService.deleteCategoryById(id)==false){
            model.addAttribute("msg","Xoa bi loi roi. hay thu lai sau");
        }
        return "redirect:/admin/category-list";
    }



}
