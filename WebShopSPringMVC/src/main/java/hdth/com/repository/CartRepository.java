package hdth.com.repository;

import hdth.com.model.Cart;

import java.util.List;

public interface CartRepository {

    List<Cart> getCartByUserId(Integer userid);

}
