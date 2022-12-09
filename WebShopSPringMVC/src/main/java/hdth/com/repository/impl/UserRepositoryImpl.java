package hdth.com.repository.impl;

import hdth.com.model.User;
import hdth.com.repository.UserRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;


    @Override
    public List<User> getUsers() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM User");
        return q.getResultList();
    }

    @Override
    public List<User> getUsersByUsername(String username) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        // criterial query api cua JPA
        CriteriaBuilder builder=session.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery=builder.createQuery(User.class);// chi dinh class truy van
        Root root= criteriaQuery.from(User.class);// tao from
        criteriaQuery = criteriaQuery.select(root);// thuc hien truy van select. ket qua ra 1 list danh sach nguoi dung


        if(!username.isEmpty()){
            Predicate p = builder.equal(root.get("username").as(String.class),username.trim());// tao dieu kien so sanh
            criteriaQuery=criteriaQuery.where(p);// truy van select them where
        }//trim() xoa khoang trang hai dau

        javax.persistence.Query q= session.createQuery(criteriaQuery);// thuc thi truy van
        return q.getResultList();// tra ve list
    }


}
