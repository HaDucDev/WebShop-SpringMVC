package hdth.com.repository.impl;


import hdth.com.model.Role;
import hdth.com.model.User;
import hdth.com.repository.RoleRepository;
import hdth.com.utils.enums.ERole;
import org.hibernate.Session;
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
public class RoleRepositoryImpl implements RoleRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Role findByName(ERole name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        // criterial query api cua JPA
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Role> criteriaQuery = builder.createQuery(Role.class);// chi dinh class truy van
        Root root = criteriaQuery.from(Role.class);// tao from
        criteriaQuery = criteriaQuery.select(root);// thuc hien truy van select. ket qua ra 1 list danh sach nguoi dung

        if (!name.toString().isEmpty() && name.toString() != null) {
            Predicate p = builder.equal(root.get("name").as(String.class), name.toString().trim());// tao dieu kien so sanh
            criteriaQuery = criteriaQuery.where(p);// truy van select them where
        }//trim() xoa khoang trang hai dau

        javax.persistence.Query q = session.createQuery(criteriaQuery);// thuc thi truy van

        List<Role> roles = q.getResultList();// tra ve list
        Role role = roles.get(0);
        return role;
    }
}
