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
    public boolean addCartbyId(Integer productId, Integer userId) {
        System.out.println("HD1");
        return this.cartRepository.addCartById(productId,userId);
    }

    @Override
    public boolean addCartbyIdSub(Integer productId, Integer userId) {
        System.out.println("HD2");
        return this.cartRepository.addCartbyIdSub(productId,userId);
    }

    @Override
    public Integer countProductCartbyUser(Integer userId) {
        return this.cartRepository.countProductCartbyUser(userId);
    }
}
