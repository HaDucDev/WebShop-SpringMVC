package hdth.com.repository.impl;

import hdth.com.model.User;
import hdth.com.repository.UserRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

    @Override
    public boolean addOrUpdateUsers(User user) {// dung duoc dang ki user, them user
        Session session= this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        }
        catch (HibernateException ex){
            System.err.println(ex.getMessage());

        }
        return false;
    }

    @Override
    public User getUserById(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        User s = session.get(User.class, id);
        return s;
    }


    //===================>USER
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Override
    public boolean changePassword(User changePasswordRequest) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getName());
        User user= userRepository.getUsersByUsername(SecurityContextHolder.getContext().getAuthentication().getName()).get(0);
        if (passwordEncoder.matches(changePasswordRequest.getOldPassword(),user.getPassword())) {// ham san kiem tra trung pass ko
            System.out.println("pass success   99999999");
            user.setPassword(passwordEncoder.encode(changePasswordRequest.getNewPassword()));
            session.save(user);
            return true;
        }
        return false;
    }


    //quen mat khau
    @Override
    public User getUserByEmail(String email) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM User u WHERE u.email =:email");
        q.setParameter("email", email);
        List<User> users = q.getResultList();
        return users.get(0);
    }

    @Override
    public boolean updateUsers(User user) {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(user);
            return true;
        }
        catch (HibernateException ex){
            System.err.println(ex.getMessage());

        }
        return false;
    }
}
