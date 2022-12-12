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
}
