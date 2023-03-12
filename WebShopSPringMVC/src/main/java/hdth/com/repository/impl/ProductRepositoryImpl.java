package hdth.com.repository.impl;


import hdth.com.model.*;
import hdth.com.repository.ProductRepository;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
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
    public List<Product> getProductsFilter(String text, Integer categoryId, Integer supplierId, Integer startPrice, Integer endPrice) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT p FROM Product p WHERE (:categoryId IS NULL OR p.category.id = :categoryId) " +
                "AND (:supplierId IS NULL OR p.supplier.id = :supplierId) AND (:text IS NULL OR p.productName LIKE :text) " +
                "AND (:startPrice IS NULL OR (p.unitPrice-p.unitPrice*p.discount/100) >= :startPrice) " +
                "AND (:endPrice IS NULL OR (p.unitPrice-p.unitPrice*p.discount/100) <= :endPrice)");

        q.setParameter("categoryId", categoryId);
        q.setParameter("supplierId", supplierId);
        q.setParameter("text","%" + text + "%");
        q.setParameter("startPrice", startPrice);
        q.setParameter("endPrice", endPrice);
        List<Product> productList = q.getResultList();
        return productList;
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
            System.out.println("sua product nha");
            Product c=this.getProductById(product.getId());
            c.setProductImage(product.getProductImage());
            c.setProductName(product.getProductName());
            c.setQuantity(product.getQuantity());
            c.setUnitPrice(product.getUnitPrice());
            c.setDiscount(product.getDiscount());
            c.setDescriptionProduct(product.getDescriptionProduct());
            c.setCategory(product.getCategory());
            c.setSupplier(product.getSupplier());;
            c.setProductstatus(product.getProductstatus());
            session.save(c);
            return true;
        }
        return false;
    }

    @Override
    public Product getProductById(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Product s = session.get(Product.class, id);
        return s;
    }

    @Override
    public boolean deleteProductById(Integer id) {
        return false;
    }
}
