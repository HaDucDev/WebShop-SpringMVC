package hdth.com.repository.impl;

import hdth.com.model.Cart;
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
        q.setParameter("x",userId);
        return q.getResultList();// day ms bat dau chay truy van
    }

    @Override
    public boolean addOrupdateCartById(Integer productId, Integer userId) {

        Session session=this.sessionFactory.getObject().getCurrentSession();

        if(productId != null && userId != null){
            Cart cart1=this.getCartByProducIdAndUserId(productId,userId);
            if(cart1 == null)
            {
                Cart cartnew = new Cart();
                cartnew.setQuantity(1);
                cartnew.setProduct(this.productService.getProductById(productId));
                cartnew.setUser(this.userDetailsService.getUserById(userId));
                session.save(cartnew);
                return true;

            }


        }
//        if(cart.getId() != null){
//            // nut o trang home
//            Cart cart1=this.getCartByProducIdAndUserId(cart);
//            if ( cart1!= null){
//                cart1.setQuantity(cart1.getQuantity()+cart.getQuantity());
//                session.save(cart1);
//                return true;
//            }
//        }
        return false;
    }


    public Cart getCartByProducIdAndUserId(Integer productId, Integer userId) {// kiem tra xem cart nay da co chua
        Session session = this.sessionFactory.getObject().getCurrentSession();// session truy van

        Query q = session.createQuery("FROM Cart c WHERE c.user.id=:x AND c.product.id=:y ");
        q.setParameter("x",userId);
        q.setParameter("y",productId);
        List<Cart> list=q.getResultList();
        if (!list.isEmpty()){// chi co 1 phan tu trong list nay thoi
                return list.get(0);
        }
        return null;
    }
}
