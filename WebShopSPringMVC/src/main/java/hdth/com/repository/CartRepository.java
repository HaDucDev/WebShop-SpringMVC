package hdth.com.repository;

import hdth.com.model.Cart;

import java.util.List;

public interface CartRepository {

    List<Cart> getCartByUserId(Integer userid);

    boolean addOrupdateCartById(Cart cart);

    Cart getCartByProducIdAndUserId(Cart cart);

}
