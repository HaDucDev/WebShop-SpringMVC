package hdth.com.repository.impl;


import hdth.com.model.*;
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
    public List<Product> getProductsFilter(String text, Integer categoryId, Integer supplierId, Integer startPrice, Integer endPrice) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        String queryStr = "SELECT p FROM Product p WHERE 1=1 ";
        if (categoryId != null && categoryId != 0) {
            queryStr += "AND p.category.id = :categoryId ";
        }
        if (supplierId != null && supplierId != 0) {
            queryStr += "AND p.supplier.id = :supplierId ";
        }
        if (text != null && !text.isEmpty()) {
            queryStr += "AND p.productName LIKE :text ";
        }
        if (startPrice != null && startPrice!=0) {
            queryStr += "AND (p.unitPrice-p.unitPrice*p.discount/100) >= :startPrice ";
        }
        if (endPrice != null && endPrice!=0) {
            queryStr += "AND (p.unitPrice-p.unitPrice*p.discount/100) <= :endPrice ";
        }

        Query q = session.createQuery(queryStr);

        if (categoryId != null && categoryId != 0) {
            q.setParameter("categoryId", categoryId);
        }
        if (supplierId != null && supplierId != 0) {
            q.setParameter("supplierId", supplierId);
        }
        if (text != null && !text.isEmpty()) {
            q.setParameter("text","%" + text + "%");
        }
        if (startPrice != null && startPrice!=0) {
            q.setParameter("startPrice", startPrice);
        }
        if (endPrice != null && endPrice!=0) {
            q.setParameter("endPrice", endPrice);
        }
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
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String hql = "DELETE FROM Product WHERE id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        int rowsAffected = query.executeUpdate();

        if(rowsAffected ==0 ){
            return false;
        }
        System.out.println(rowsAffected + " rows deleted.");
        return true;
    }
}
