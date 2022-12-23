package hdth.com.controller.restAPI;


import hdth.com.model.Cart;
import hdth.com.model.User;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@RestController
public class CartControllerREST {

    @Autowired
    CartService cartService;


    @PostMapping(path = "/api/cart")
    public boolean addProductoCart(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        return this.cartService.addCartbyId(cart.getProductId(),user.getId());
    }
}
