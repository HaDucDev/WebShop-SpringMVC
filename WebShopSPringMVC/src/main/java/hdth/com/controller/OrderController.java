package hdth.com.controller;


import hdth.com.model.Category;
import hdth.com.model.Order;
import hdth.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;


    @PostMapping("/user/create-order")
    private String addOrUpdateCategories(@ModelAttribute Order order, Model model){
        if (order.getMethodPayment() ==0){
            if(this.orderService.createOrder(order)==true){
                return "user/a-map";// test
            }
        }
        if (order.getMethodPayment() ==1){
//            if(this.orderService.createOrder(order)==true){
//                return "user/a-map";// test
//            }
        }

        return "redirect:/user/order-confirmation/api";// test
    }



}
