package hdth.com.service;

import hdth.com.model.Cart;

import java.util.List;

public interface CartService {
    List<Cart> getCartByUserId(Integer userId);

    boolean addCartbyId(Integer productId,Integer userId);

}
