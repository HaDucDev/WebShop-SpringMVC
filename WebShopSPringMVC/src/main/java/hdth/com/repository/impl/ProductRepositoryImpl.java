package hdth.com.repository.impl;


import hdth.com.model.Product;
import hdth.com.repository.ProductRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Product> getProducts() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Product ");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdateProducts(Product product) {
        return false;
    }

    @Override
    public Product getSupplierById(Integer id) {
        return null;
    }

    @Override
    public boolean deleteProductById(Integer id) {
        return false;
    }
}
