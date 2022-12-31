package hdth.com.controller.restAPI;


import hdth.com.model.Cart;
import hdth.com.model.User;
import hdth.com.service.CartService;
import hdth.com.utils.common.ObjectCount;
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


    @PostMapping(path = "/api/cart")// index page
    public ObjectCount addProductoCartHome(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        ObjectCount objectCount=new ObjectCount();
        if(user != null &&  this.cartService.addCartbyId(cart.getProductId(),user.getId())==true)
        {
            objectCount.setCountCart(this.cartService.countProductCartbyUser(user.getId()));
            return objectCount;
        }
        objectCount.setCountCart(0);
        return objectCount;
    }

    @PostMapping(path = "/api/cart/add")// cart page
    public Integer addProductoCart(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if(user != null &&  this.cartService.addCartbyId(cart.getProductId(),user.getId())==true)
        {
            return this.cartService.countProductCartbyUser(user.getId());
        }
        return  0;
    }

    @PostMapping(path = "/api/cart/sub")
    public Integer addProductoCartSub(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if(this.cartService.addCartbyIdSub(cart.getProductId(),user.getId())==true)
        {
            return this.cartService.countProductCartbyUser(user.getId());
        }
        return  0;
    }
}
