package hdth.com.service;

import hdth.com.model.Order;

import java.util.Map;

public interface PaymentMomoService {

    boolean signature(Map<String, String> params);
    String successfulTransaction(Order order);

}
