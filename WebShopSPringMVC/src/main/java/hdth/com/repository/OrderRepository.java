package hdth.com.repository;


import hdth.com.model.Order;

import java.util.List;

public interface OrderRepository {


    List<Order> getAllOrdersWeb();

    boolean createOrder(Order order);
}
