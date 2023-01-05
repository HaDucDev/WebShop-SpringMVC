package hdth.com.repository.impl;


import hdth.com.model.Reviews;
import hdth.com.repository.ReviewsRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ReviewsRepositoryImpl implements ReviewsRepository {


    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Reviews addComment(Reviews reviews) {

        Session session= this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(reviews);
            return reviews;
        }
        catch (HibernateException ex){
            ex.printStackTrace();
        }

        return null;
    }
}
