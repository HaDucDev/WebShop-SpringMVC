package hdth.com.repository.impl;


import com.sun.security.auth.UserPrincipal;
import hdth.com.model.Cart;
import hdth.com.model.Order;
import hdth.com.model.OrderDetail;
import hdth.com.model.User;
import hdth.com.repository.CartRepository;
import hdth.com.repository.OrderRepository;
import hdth.com.repository.ProductRepository;
import hdth.com.repository.UserRepository;
import hdth.com.utils.common.ConstValueWeb;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
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



    @Override
    public boolean createOrder(Order order) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Order ordernew= new Order();
            ordernew.setDeliveryAddress(order.getDeliveryAddress());
            ordernew.setPhoneNumber(order.getPhoneNumber());
            ordernew.setReceiptUser(order.getReceiptUser());

            //Date date = new Date(System.currentTimeMillis());
           // ordernew.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString()));
          // ordernew.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LocalDateTime.now().toString()));// parse bien chuoi thanh date.
            ordernew.setCreatedDate(new Date(System.currentTimeMillis()));;
            if (order.getMethodPayment() ==0){
                ordernew.setPaymentStatus(ConstValueWeb.CHUA_THANH_TOAN);
                ordernew.setStatusOrder(ConstValueWeb.DANG_CHO);

                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                String name = auth.getName(); //get logged in username
                User user=this.userRepository.getUsersByUsername(name).get(0);

                //ordernew.setTotalAmount(Long.parseLong(String.valueOf(tong)));
                ordernew.setTotalAmount(totalMoneyOrder(user.getId()));
                ordernew.setUser(user);
                session.save(ordernew);

                // luu chi tiet hoa don
                List<Cart> carts=this.cartRepository.getCartByUserId(user.getId());
                for ( Cart c: carts){
                    OrderDetail orderDetail=new OrderDetail();
                    orderDetail.setOrder(ordernew);// khi dat gia tri thi da co doi tuong roi. luu thoi
                    orderDetail.setProduct(c.getProduct());
                    orderDetail.setQuantity(c.getQuantity());
                    orderDetail.setAmount(Long.valueOf(c.getQuantity()*c.getProduct().getUnitPrice()));
                    session.save(orderDetail);
                }


                return true;
            }




        } catch (Exception ex) {
            System.out.println("loi save order - orderdetail" + ex);
            ex.printStackTrace();// in ra cac buoc den dau bi loi
        }

//        else {
//            System.out.println("ok roi nha");
//            Category c=this.getCategoryById(category.getId());
//            c.setName(category.getName());
//            session.save(c);
//            return true;
//        }


        return false;
    }

    public Long totalMoneyOrder(Integer userId){// tong tien hoa don
        List<Cart> carts=this.cartRepository.getCartByUserId(userId);
        int tong=0;
        for ( Cart c: carts){
            tong=tong+c.getQuantity()*c.getProduct().getUnitPrice();
        }
        Long x=Long.valueOf(tong);// convert int to long
        return x;
    }



}
