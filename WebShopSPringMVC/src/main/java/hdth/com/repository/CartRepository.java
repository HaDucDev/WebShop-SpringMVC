package hdth.com.repository;

import hdth.com.model.Cart;

import java.util.List;

public interface CartRepository {

    List<Cart> getCartByUserId(Integer userid);

    boolean addCartById(Integer productId, Integer userid);

    //Cart getCartByProducIdAndUserId(Integer productId);// kiem tra san pham co trong gio hang nguoi dung chua


    Integer countProductCartbyUser(Integer userId);
}
