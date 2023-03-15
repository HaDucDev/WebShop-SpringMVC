package hdth.com.service;

import hdth.com.model.Cart;

import java.util.List;

public interface CartService {
    List<Cart> getCartByUserId(Integer userId);

    boolean addCartbyId(Integer productId,Integer userId);

    boolean addCartbyIdSub(Integer productId,Integer userId);

    Integer countProductCartbyUser(Integer userId);

    boolean deleteCartById(Integer id);

    Integer totalMoneyOrder (Integer integer);

}
