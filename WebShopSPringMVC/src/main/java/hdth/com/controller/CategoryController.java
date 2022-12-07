package hdth.com.controller;


import hdth.com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/category")
    private String getCategorys(Model model){
        model.addAttribute("cateList",this.categoryService.getCategories());
        return "admin/view/list-user";
    }
}
