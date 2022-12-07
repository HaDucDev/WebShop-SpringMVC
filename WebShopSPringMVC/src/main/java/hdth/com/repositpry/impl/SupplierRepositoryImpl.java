package hdth.com.repositpry.impl;

import hdth.com.model.Category;
import hdth.com.model.Supplier;
import hdth.com.repositpry.SupplierRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public class SupplierRepositoryImpl implements SupplierRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Supplier> getSuppliers() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Supplier ");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdateSuppliers(Supplier supplier) {
        return false;
    }

    @Override
    public Category getSupplierById(Integer id) {
        return null;
    }

    @Override
    public boolean deleteSupplierById(Integer id) {
        return false;
    }
}
