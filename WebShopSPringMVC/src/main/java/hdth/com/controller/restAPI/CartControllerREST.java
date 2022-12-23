package hdth.com.controller.restAPI;


import hdth.com.model.Cart;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class CartControllerREST {

    @Autowired
    CartService cartService;


    @PostMapping("/api/cart")
    public boolean addProductoCart(@RequestBody Cart cart){// @RequestBody bien json thanh object
        return this.cartService.addOrUpdateCartbyId(cart);
    }
}
