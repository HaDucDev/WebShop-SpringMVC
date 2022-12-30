package hdth.com.repository.impl;

import hdth.com.model.Cart;
import hdth.com.model.OrderDetail;
import hdth.com.model.Product;
import hdth.com.model.User;
import hdth.com.repository.CartRepository;
import hdth.com.service.ProductService;
import hdth.com.service.UserService;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
@Transactional
public class CartRepositoryImpl implements CartRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userDetailsService;


    @Override
    public List<Cart> getCartByUserId(Integer userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Cart c WHERE c.user.id=:x");
        q.setParameter("x", userId);
        return q.getResultList();// day ms bat dau chay truy van
    }

    @Override
    public boolean addCartById(Integer productId, Integer userId) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        System.out.println("HD2");
        System.out.println(productId + " ----fffff----  " + userId);
        if (productId != null && userId != null) {
            List<Cart> listCart = this.getCartByProducIdAndUserId(productId, userId);
            if (listCart.isEmpty()) {
                Cart cartnew = new Cart();
                cartnew.setQuantity(1);
                cartnew.setProduct(this.productService.getProductById(productId));
                cartnew.setUser(this.userDetailsService.getUserById(userId));
                session.save(cartnew);
                return true;
            } else {
                Cart cart1 = listCart.get(0);
                if (cart1 != null) {
                    cart1.setQuantity(cart1.getQuantity() + 1);
                    session.save(cart1);
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean addCartbyIdSub(Integer productId, Integer userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if (productId != null && userId != null) {
            List<Cart> listCart = this.getCartByProducIdAndUserId(productId, userId);

            Cart cart1 = listCart.get(0);
            if (cart1 != null) {
                cart1.setQuantity(cart1.getQuantity() - 1);
                session.save(cart1);
                return true;
            }
        }
        return false;
    }

    @Override
    public Integer countProductCartbyUser(Integer userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();// session truy van
        Query q = session.createQuery("SELECT count(c.product.id), max(c.quantity) FROM Cart c WHERE c.user.id=:x ");
        q.setParameter("x", userId);
        List<Object[]> list = q.getResultList();// phai co 2 cot tro len ms duoc khong thi no se loi
        System.out.println(list.get(0)[0] + "ghjjkjjujhhjh" + list.get(0)[1]);
        System.out.println(list.get(0)[0]);
        Integer m = Integer.valueOf(list.get(0)[0].toString());// khi minh in ra thi no la Long. minh chuyen Long thanh chuoi sau do chuoi thanh Integer
        return m;
    }

    @Override
    public Long totalMoneyCartbyUser(Integer userId) {
        List<Cart> carts = this.getCartByUserId(userId);
        int tong = 0;
        for (Cart c : carts) {
            tong = tong + c.getQuantity() * c.getProduct().getUnitPrice();
        }
        return Long.valueOf(tong);
    }


    public List<Cart> getCartByProducIdAndUserId(Integer productId, Integer userId) {// kiem tra xem cart nay da co chua
        Session session = this.sessionFactory.getObject().getCurrentSession();// session truy van

        Query q = session.createQuery("FROM Cart c WHERE c.user.id=:x AND c.product.id=:y ");
        q.setParameter("x", userId);
        q.setParameter("y", productId);
        List<Cart> list = q.getResultList();
        return list;
    }

}
