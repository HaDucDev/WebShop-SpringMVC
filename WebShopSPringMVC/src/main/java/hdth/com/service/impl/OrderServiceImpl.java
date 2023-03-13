package hdth.com.service.impl;

import hdth.com.model.Order;
import hdth.com.repository.CartRepository;
import hdth.com.repository.OrderRepository;
import hdth.com.service.OrderService;
import org.apache.http.auth.AUTH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private OrderRepository orderRepository;

    //==========> ADMIN

    @Override
    public List<Order> getAllOrdersWeb() {
        return this.orderRepository.getAllOrdersWeb();
    }

    @Override
    public Order getDetailOrderByOrderId(Integer orderId) {
        return this.orderRepository.getDetailOrderByOrderId(orderId);
    }

    @Override
    public boolean confirmOrderById(Integer id) {
        return this.orderRepository.confirmOrderById(id);
    }


    //=============> USER
    @Override
    public boolean createOrder(Order order) {
        return this.orderRepository.createOrder(order);
    }

    @Override
    public Long totalMoneyCartbyUser(Integer userId) {
        return this.cartRepository.totalMoneyCartbyUser(userId);
    }

    @Override
    public List<Order> getAllOrdersByUserId(Integer userId) {
        return this.orderRepository.getAllOrdersByUserId(userId);
    }

    @Override
    public Order getDetailOrderByOrderIdAndUserId(Integer orderId, Integer userId) {
        return this.orderRepository.getDetailOrderByOrderIdAndUserId(orderId,userId);
    }


}
