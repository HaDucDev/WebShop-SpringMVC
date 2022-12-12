package hdth.com.controller.restAPI;


import hdth.com.model.Cart;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class CartControllerREST {


    @PostMapping("/api/cart")
    public boolean addProductoCart(@RequestBody Cart cart){


//        Map<Integer, Cart> cartMap= (Map<Integer, Cart>) session.getAttribute("cart");
//
//        if(cartMap == null){
//            cartMap= new HashMap<>();
//        }
//
//        int  productId=cart.getProductId();
//        if(cartMap.containsKey(productId) == true){
//            // san pham co trong gio roi
//            Cart c= cartMap.get(productId);// lay thong tin san pham trong gio
//            c.setCount(c.getCount()+1);
//
//        }
//
//        else {// san pham chua co trong gio
//            cartMap.put(productId,cart);
//        }
//
//        session.setAttribute("cart",cartMap);
//        return Utils.countCart(cartMap) ;
        return false;
    }
}
