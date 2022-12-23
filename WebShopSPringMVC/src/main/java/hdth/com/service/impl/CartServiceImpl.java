package hdth.com.service.impl;

import hdth.com.model.Cart;
import hdth.com.repository.CartRepository;
import hdth.com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Override
    public List<Cart> getCartByUserId(Integer userId) {

        return this.cartRepository.getCartByUserId(userId);
    }

    @Override
    public boolean addOrUpdateCartbyId(Integer productId, Integer userId) {
        return this.cartRepository.addOrupdateCartById(productId,userId);
    }
}
