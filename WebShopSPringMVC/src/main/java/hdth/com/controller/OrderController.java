package hdth.com.controller;



import hdth.com.model.Order;
import hdth.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;


    @PostMapping("/user/create-order")
    private String addOrders(@ModelAttribute Order order, HttpServletRequest request){
        if (order.getMethodPayment() ==0){
            if(this.orderService.createOrder(order)==true){
                return "user/a-map";// test
            }
        }
        if (order.getMethodPayment() ==1){
//            if(this.orderService.createOrder(order)==true){
//                return "user/a-map";// test
//            }
            HttpSession session= request.getSession();
            session.setAttribute("user_recipt",order.getReceiptUser());
            session.setAttribute("user_sdt",order.getPhoneNumber());
            session.setAttribute("user_address",order.getDeliveryAddress());
            //return "redirect:/user/paymentmomo/api";// ket qua tra ve o day la link khi giao dich thanh cong payUrl
        }

        return "redirect:/user/order-confirmation/api";// test
    }






}
