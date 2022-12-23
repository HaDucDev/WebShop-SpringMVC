package hdth.com.repository.impl;

import hdth.com.model.Cart;
import hdth.com.repository.CartRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CartRepositoryImpl implements CartRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;


    @Override
    public List<Cart> getCartByUserId(Integer userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Cart c WHERE c.user.id=:x");
        q.setParameter("x",userId);
        return q.getResultList();// day ms bat dau chay truy van
    }

    @Override
    public boolean addOrupdateCartById(Cart cart) {

        Session session=this.sessionFactory.getObject().getCurrentSession();

        if(cart.getId()== null){
            session.save(cart);
            return true;
        }
        if(cart.getId() != null){
            // nut o trang home
            Cart cart1=this.getCartByProducIdAndUserId(cart);
            if ( cart1!= null){
                cart1.setQuantity(cart1.getQuantity()+cart.getQuantity());
                session.save(cart1);
                return true;
            }
        }
        return false;
    }

    @Override
    public Cart getCartByProducIdAndUserId(Cart cart) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(cart.getId()!= null){
            Query q = session.createQuery("FROM Cart c WHERE c.user.id=:x AND c.product.id=:y ");
            q.setParameter("x",cart.getUser().getId());
            q.setParameter("y",cart.getProduct().getId());
            List<Cart> list=q.getResultList();
            if (!list.isEmpty()){// chi co 1 phan tu trong list nay thoi
                return list.get(0);
            }
        }
        return null;
    }
}
