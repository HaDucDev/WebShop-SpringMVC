package hdth.com.controller;


import hdth.com.model.Category;
import hdth.com.model.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {


    @PostMapping("/user/create-order")
    private String addOrUpdateCategories(@ModelAttribute Order order, Model model){
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
        return "forward:/admin/category/edit/{id}";// chuyen tiep nhung du lieu id van con neu truong hop loi
    }



}
