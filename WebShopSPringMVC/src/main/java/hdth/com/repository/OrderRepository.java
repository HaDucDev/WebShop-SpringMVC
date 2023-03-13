package hdth.com.repository;


import hdth.com.model.Order;

import java.util.List;

public interface OrderRepository {


    // ADMIN
    List<Order> getAllOrdersWeb();

    Order getDetailOrderByOrderId(Integer orderId);


    // USER
    boolean createOrder(Order order);

    List<Order> getAllOrdersByUserId(Integer userId);

    Order getDetailOrderByOrderIdAndUserId(Integer orderId,Integer userId);

    boolean confirmOrderById (Integer id);
}
