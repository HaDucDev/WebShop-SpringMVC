package hdth.com.service;

import hdth.com.model.Order;

import java.util.List;

public interface OrderService {

    //=============> ADMIN
    List<Order> getAllOrdersWeb();

    Order getDetailOrderByOrderId(Integer orderId);

    boolean confirmOrderById (Integer id);

    boolean deliveryConfirmOrderById (Integer id);

    //==============> USER

    boolean createOrder(Order order);

    Long totalMoneyCartbyUser(Integer userId);

    List<Order> getAllOrdersByUserId(Integer userId);

    Order getDetailOrderByOrderIdAndUserId(Integer orderId,Integer userId);


}
