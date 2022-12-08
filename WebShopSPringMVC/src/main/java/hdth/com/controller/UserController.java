package hdth.com.controller;

import hdth.com.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/admin/user-list")
    private String getSupplier(Model model) {
        model.addAttribute("userList", this.userService.getUsers());
        return "/admin/a-list-user";
    }
}
