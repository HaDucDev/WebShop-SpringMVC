package hdth.com.controller;



import com.mservice.allinone.models.CaptureMoMoResponse;
import hdth.com.config.paymentMoMo.MomoConfig;
import hdth.com.model.Order;
import hdth.com.model.User;
import hdth.com.service.OrderService;
import hdth.com.utils.common.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private MomoConfig momoConfig;


    @PostMapping("/user/create-order")
    private ModelAndView addOrders(@ModelAttribute Order order, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (order.getMethodPayment() ==0){
            if(this.orderService.createOrder(order)==true){
                String projectUrl="user/a-map";
                return new ModelAndView(projectUrl);
            }
        }
        if (order.getMethodPayment() ==1){
            HttpSession session= request.getSession();
            session.setAttribute("user_recipt",order.getReceiptUser());
            session.setAttribute("user_sdt",order.getPhoneNumber());
            session.setAttribute("user_address",order.getDeliveryAddress());
            User user = (User) session.getAttribute("currentUser");
            if(user != null){
                String orderId= Utils.getRandomNumber(5) + user.getUsername() + System.currentTimeMillis();
                String requestId=Utils.getRandomNumber(4) + user.getId().toString() + System.currentTimeMillis();
                String total=this.orderService.totalMoneyCartbyUser(user.getId()).toString();
                String orderInfo="Thanh toán đơn hàng";
                String returnURL="http://localhost:8080/WebShopSPringMVC_war/test/api/momo";
                String notifyURL="http://localhost:8080/WebShopSPringMVC_war/test/api/momo";
                String extraData="6";
                CaptureMoMoResponse captureMoMoResponse = this.momoConfig.process(orderId, requestId, total, orderInfo, returnURL, notifyURL, extraData);
                String url= captureMoMoResponse.getPayUrl();
                return new ModelAndView("redirect:" + url);
            }

        }
        return new ModelAndView("redirect:/user/order-confirmation/api");
    }






}
