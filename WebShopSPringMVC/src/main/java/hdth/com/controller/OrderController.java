package hdth.com.controller;


import com.mservice.allinone.models.CaptureMoMoResponse;
import hdth.com.config.paymentMoMo.MomoConfig;
import hdth.com.model.Order;
import hdth.com.model.User;
import hdth.com.service.OrderService;
import hdth.com.service.PaymentMomoService;
import hdth.com.utils.common.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private MomoConfig momoConfig;



    //=====> ADMIN
    @GetMapping("/admin/order-list-all")
    public String getOrderAllWeb(Model model) {
        model.addAttribute("orderList", this.orderService.getAllOrdersWeb());
        System.out.println(this.orderService.getAllOrdersWeb().get(3).getStatusOrder());
        return "/admin/a-list-order";
    }


    @GetMapping("/admin/order-detail/{orderId}")
    public String getDetailOrderByOrderId(Model model, @PathVariable(value = "orderId") Integer orderId) {
        model.addAttribute("orderDetal", this.orderService.getDetailOrderByOrderId(orderId));// tra ve 1 order
        return "/admin/a-list-order-detail";
    }


    @GetMapping("/admin/order/confirm-order/{id}")//chap nhan don
    private String confirmOrder(@PathVariable(name = "id") Integer id) {
        if (this.orderService.confirmOrderById(id)==true)
        {
            return "redirect:/admin/order-list-all";
        }
        return "redirect:/admin/order-list-all";
    }


    @GetMapping("/admin/order/confirm-delivery-order/{id}")// da giao don
    private String deliveryConfirmOrder(@PathVariable(name = "id") Integer id) {
        if (this.orderService.deliveryConfirmOrderById(id)==true)
        {
            return "redirect:/admin/order-list-all";
        }
        return "redirect:/admin/order-list-all";
    }


    //================================================================


    // USER
    @PostMapping("/user/create-order")// tao don hang o trang thanh toan
    private ModelAndView addOrders(@ModelAttribute Order order, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (order.getMethodPayment() == 0) {
            if (this.orderService.createOrder(order) == true) {
                String projectUrl = "http://localhost:8080/WebShopSPringMVC_war/user/order-manager";
                //return new ModelAndView(projectUrl);
                return new ModelAndView("redirect:" + projectUrl);

            }
        }
        if (order.getMethodPayment() == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("user_recipt", order.getReceiptUser());
            session.setAttribute("user_sdt", order.getPhoneNumber());
            session.setAttribute("user_address", order.getDeliveryAddress());
            User user = (User) session.getAttribute("currentUser");
            if (user != null) {
                String orderId = Utils.getRandomNumber(5) + user.getUsername() + System.currentTimeMillis();
                String requestId = Utils.getRandomNumber(4) + user.getId().toString() + System.currentTimeMillis();
                String total = this.orderService.totalMoneyCartbyUser(user.getId()).toString();
                String orderInfo = "Thanh toán đơn hàng";
                String returnURL = "http://localhost:8080/WebShopSPringMVC_war/test/api/momo";
                String notifyURL = "http://localhost:8080/WebShopSPringMVC_war/test/api/momo";
                String extraData = "6";
                CaptureMoMoResponse captureMoMoResponse = this.momoConfig.process(orderId, requestId, total, orderInfo, returnURL, notifyURL, extraData);
                String url = captureMoMoResponse.getPayUrl();
                return new ModelAndView("redirect:" + url);
            }

        }
        return new ModelAndView("redirect:/user/order-confirmation/api");
    }


    @Autowired
    private PaymentMomoService paymentMomoService;

    @GetMapping("/test/api/momo")// thanh toan momo thanh cong chuyen ve day
    public String testMomo1(@RequestParam Map<String, String> params, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("currentUser") != null) {
            Order ordernew = new Order();
            ordernew.setReceiptUser(session.getAttribute("user_recipt").toString());
            ordernew.setPhoneNumber(session.getAttribute("user_sdt").toString());
            ordernew.setDeliveryAddress(session.getAttribute("user_address").toString());
            ordernew.setMethodPayment(1);
            if (params.isEmpty() == false && (this.paymentMomoService.signature(params) == true)) {// thanh toan that bai khong tao don hang
                if (this.orderService.createOrder(ordernew) == true) {
                    // xoa thong tin don hang tai session
                    session.removeAttribute("user_recipt");
                    session.removeAttribute("user_sdt");
                    session.removeAttribute("user_address");
                    return "redirect:/user/order-manager";// test
                }
            }
        }
        return "/user/404";
    }


    // quan ly don hang nguoi dung
    @GetMapping("/user/order-manager")
    private String getOrderByUser(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("currentUser");
        if ( user != null) {
            Integer userId= user.getId();
            model.addAttribute("userOrderList", this.orderService.getAllOrdersByUserId(userId));
        }
        return "/user/inforOrderUser";
    }


    @GetMapping("/user/order-detail/{orderId}")// chi tiet don hang cua nguoi dung
    public String getDetailOrderUserByOrderId(Model model, @PathVariable(value = "orderId") Integer orderId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("currentUser");
        if ( user != null) {
            model.addAttribute("orderDetal", this.orderService.getDetailOrderByOrderIdAndUserId(orderId,user.getId()));// tra ve 1 order
        }
        return "/user/list-order-detail";
    }





}
