package hdth.com.repository.impl;

import hdth.com.model.ProducStatus;
import hdth.com.repository.ProductStatusRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ProductStatusRepositoryImpl implements ProductStatusRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<ProducStatus> getProducStatuses() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM ProducStatus ");
        return q.getResultList();
    }
}
