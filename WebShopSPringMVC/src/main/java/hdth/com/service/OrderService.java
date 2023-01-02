package hdth.com.service;

import hdth.com.model.Order;

import java.util.List;

public interface OrderService {

    //=============> ADMIn
    List<Order> getAllOrdersWeb();



    //==============> USER

    boolean createOrder(Order order);

    Long totalMoneyCartbyUser(Integer userId);
}
