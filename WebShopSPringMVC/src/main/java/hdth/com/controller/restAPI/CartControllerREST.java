package hdth.com.controller.restAPI;


import hdth.com.model.Cart;
import hdth.com.model.User;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@RestController
public class CartControllerREST {

    @Autowired
    CartService cartService;


    @PostMapping(path = "/api/cart")// index page
    public ResponseEntity<Integer> addProductoCartHome(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if(user != null &&  this.cartService.addCartbyId(cart.getProductId(),user.getId())==true)
        {
            return new ResponseEntity<>(this.cartService.countProductCartbyUser(user.getId()), HttpStatus.OK) ;
        }
        return  new ResponseEntity<>(0, HttpStatus.CREATED) ;
    }

    @PutMapping (path = "/api/cart/add")// cart page
    public ResponseEntity<Integer> addProductoCart(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if(user != null &&  this.cartService.addCartbyId(cart.getProductId(),user.getId())==true)
        {
            return new ResponseEntity<>(this.cartService.countProductCartbyUser(user.getId()), HttpStatus.OK) ;
        }
        return  new ResponseEntity<>(0, HttpStatus.CREATED) ;
    }

    @PutMapping(path = "/api/cart/sub")
    public  ResponseEntity<Integer> addProductoCartSub(@RequestBody Cart cart, HttpServletRequest request){// @RequestBody bien json thanh object
        HttpSession httpSession= request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if(this.cartService.addCartbyIdSub(cart.getProductId(),user.getId())==true)
        {
            return new ResponseEntity<>(this.cartService.countProductCartbyUser(user.getId()), HttpStatus.OK) ;
        }
        return  new ResponseEntity<>(0, HttpStatus.CREATED);
    }
}
