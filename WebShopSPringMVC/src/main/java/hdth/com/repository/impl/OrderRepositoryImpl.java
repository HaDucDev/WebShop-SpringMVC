package hdth.com.repository.impl;


import com.sun.security.auth.UserPrincipal;
import hdth.com.model.Cart;
import hdth.com.model.Order;
import hdth.com.model.OrderDetail;
import hdth.com.model.User;
import hdth.com.repository.CartRepository;
import hdth.com.repository.OrderRepository;
import hdth.com.repository.UserRepository;
import hdth.com.utils.common.ConstValueWeb;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;


@Repository
@Transactional
public class OrderRepositoryImpl implements OrderRepository {


    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UserRepository userRepository;



    //================> admin

    @Override
    public List<Order> getAllOrdersWeb() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Order ");
        return q.getResultList();
    }

    @Override
    public Order getDetailOrderByOrderId(Integer orderId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Order o WHERE o.id=:x");
        q.setParameter("x",orderId);
        Order order= (Order) q.getResultList().get(0);
        return order;
    }


    //================> user

    @Override
    public boolean createOrder(Order order) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Order ordernew = new Order();
            ordernew.setDeliveryAddress(order.getDeliveryAddress());
            ordernew.setPhoneNumber(order.getPhoneNumber());
            ordernew.setReceiptUser(order.getReceiptUser());

            //Date date = new Date(System.currentTimeMillis());
            // ordernew.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString()));
            // ordernew.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LocalDateTime.now().toString()));// parse bien chuoi thanh date.
            ordernew.setCreatedDate(new Date(System.currentTimeMillis()));
            ;
            if (order.getMethodPayment() == 0) {
                ordernew.setPaymentStatus(ConstValueWeb.CHUA_THANH_TOAN);
            }
            if (order.getMethodPayment() == 1) {
                ordernew.setPaymentStatus(ConstValueWeb.DA_THANH_TOAN_MOMO);
            }

            ordernew.setStatusOrder(ConstValueWeb.DANG_CHO);
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String name = auth.getName(); //get logged in username
            User user = this.userRepository.getUsersByUsername(name).get(0);

            //ordernew.setTotalAmount(Long.parseLong(String.valueOf(tong)));
            ordernew.setTotalAmount(totalMoneyOrder(user.getId()));
            ordernew.setUser(user);
            session.save(ordernew);

            // luu chi tiet hoa don
            List<Cart> carts = this.cartRepository.getCartByUserId(user.getId());
            if (!carts.isEmpty()){
                for (Cart c : carts) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(ordernew);// khi dat gia tri thi da co doi tuong roi. luu thoi
                    orderDetail.setProduct(c.getProduct());
                    orderDetail.setQuantity(c.getQuantity());
                    orderDetail.setAmount(Long.valueOf(c.getQuantity() * c.getProduct().getUnitPrice()));
                    session.save(orderDetail);

                    session.delete(c);
                    if (carts.isEmpty()){
                        break;
                    }
                }

                return true;
            }
        } catch (Exception ex) {
            System.out.println("loi save order - orderdetail" + ex);
            ex.printStackTrace();// in ra cac buoc den dau bi loi
        }

        return false;
    }

    public Long totalMoneyOrder(Integer userId) {// tong tien hoa don
        List<Cart> carts = this.cartRepository.getCartByUserId(userId);
        int tong = 0;
        if (!carts.isEmpty()){
            for (Cart c : carts) {
                tong = tong + c.getQuantity() * c.getProduct().getUnitPrice();
            }
        }
        Long x = Long.valueOf(tong);// convert int to long
        return x;
    }


}
