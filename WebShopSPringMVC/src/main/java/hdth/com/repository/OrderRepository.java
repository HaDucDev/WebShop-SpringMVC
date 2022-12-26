package hdth.com.repository;


import hdth.com.model.Order;

public interface OrderRepository {

    boolean createOrder(Order order);
}
