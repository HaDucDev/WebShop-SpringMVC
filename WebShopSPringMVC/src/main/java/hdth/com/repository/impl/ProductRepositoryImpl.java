package hdth.com.repository.impl;


import hdth.com.model.Product;
import hdth.com.model.Supplier;
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

        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(product.getId() == null){
            try {
                session.save(product);
                return true;
            } catch (Exception ex) {
                System.out.println("loi add supplier" + ex);
                ex.printStackTrace();// in ra cac buoc den dau bi loi
            }
        }
        else {// edit
//            System.out.println("ok supplier nha");
//            Supplier c=this.getSupplierById(supplier.getId());
//            c.setSupplierName(supplier.getSupplierName());
//            c.setLogoImage(supplier.getLogoImage());
//            session.save(c);
//            return true;
        }
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
