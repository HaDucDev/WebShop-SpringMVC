package hdth.com.service.impl;

import hdth.com.model.Order;
import hdth.com.repository.OrderRepository;
import hdth.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public boolean createOrder(Order order) {
        return this.orderRepository.createOrder(order);
    }
}
