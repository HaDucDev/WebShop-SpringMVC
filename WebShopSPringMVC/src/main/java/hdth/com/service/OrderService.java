package hdth.com.service;

import hdth.com.model.Order;

import java.util.List;

public interface OrderService {

    //=============> ADMIN
    List<Order> getAllOrdersWeb();

    Order getDetailOrderByOrderId(Integer orderId);



    //==============> USER

    boolean createOrder(Order order);

    Long totalMoneyCartbyUser(Integer userId);
}