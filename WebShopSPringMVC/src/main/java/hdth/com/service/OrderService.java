package hdth.com.service;

import hdth.com.model.Order;

public interface OrderService {
    boolean createOrder(Order order);

    Long totalMoneyCartbyUser(Integer userId);
}
