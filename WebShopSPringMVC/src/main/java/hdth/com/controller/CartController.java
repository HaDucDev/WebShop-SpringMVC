package hdth.com.controller;

import hdth.com.model.Cart;
import hdth.com.model.User;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping("/user/cart")
    public String indexCart(Model model, HttpSession session){

        User user= (User) session.getAttribute("currentUser");
        Integer userId= user.getId();
        model.addAttribute("cartList",this.cartService.getCartByUserId(userId));
        return "user/cart";
    }
}
