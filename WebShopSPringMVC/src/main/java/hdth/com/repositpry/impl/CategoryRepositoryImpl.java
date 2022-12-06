package hdth.com.repositpry.impl;

import hdth.com.model.Category;
import hdth.com.repositpry.CategoryRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Category> getCategories() {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        Query q=session.createQuery("FROM Category ");
        return q.getResultList();
    }
}
