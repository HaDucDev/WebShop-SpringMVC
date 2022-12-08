package hdth.com.repository.impl;

import hdth.com.model.Category;
import hdth.com.repository.CategoryRepository;
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
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Category ");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdateCategories(Category category) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(category.getId() == null){
            try {
                session.save(category);
                return true;
            } catch (Exception ex) {
                System.out.println("loi add category" + ex);
                ex.printStackTrace();// in ra cac buoc den dau bi loi
            }
        }
        else {
            System.out.println("ok roi nha");
            Category c=this.getCategoryById(category.getId());
            c.setName(category.getName());
            session.save(c);
            return true;
        }
        return false;
    }

    @Override
    public Category getCategoryById(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Category c = session.get(Category.class, id);
        return c;

    }

    @Override
    public boolean deletecategoryById(Integer id) {
        Session session=this.sessionFactory.getObject().getCurrentSession();
        Category c= this.getCategoryById(id);
        if (this.getCategoryById(id) != null){
            session.delete(c);
            return true;
        }
        return false;
    }
}
