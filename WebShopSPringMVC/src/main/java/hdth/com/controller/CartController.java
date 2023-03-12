package hdth.com.controller;

import hdth.com.model.Order;
import hdth.com.model.User;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping("/user/cart-list")
    public String indexCart(Model model, HttpSession session){

        User user= (User) session.getAttribute("currentUser");
        if(user != null){
            Integer userId= user.getId();
            model.addAttribute("cartList",this.cartService.getCartByUserId(userId));
            return "user/cart";
        }
        String mess="Bạn phải đăng nhập mới có thể mua hàng";
        model.addAttribute("usernotnull",mess);
        return "user/login";
    }

    @GetMapping("/user/order-confirmation/api")
    public String indexOrderConfirmation(Model model, HttpSession session){

        User user= (User) session.getAttribute("currentUser");
        if(user != null){
            Integer userId= user.getId();
            if(!this.cartService.getCartByUserId(userId).isEmpty()){
                model.addAttribute("cartList",this.cartService.getCartByUserId(userId));
                model.addAttribute("order",new Order());
                return "user/order-confirmation";
            }
            else {
                return "redirect:/user/cart-list";
            }
        }
        return "user/login";
    }

    @GetMapping("/user/delete-cart/{id}")
    public String deleteCart(Model model, HttpSession session, @PathVariable("id") Integer id){

        User user= (User) session.getAttribute("currentUser");
        if(user != null){
            if(!this.cartService.deleteCartById(id)==true){
                return "redirect:/user/cart-list";// test
            }
            return "redirect:/user/cart-list";
        }
        return "user/login";
    }


}
