package hdth.com.repository.impl;

import hdth.com.model.Supplier;
import hdth.com.repository.SupplierRepository;
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
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if(supplier.getId() == null){
            try {

                session.save(supplier);
                return true;
            } catch (Exception ex) {
                System.out.println("loi add supplier" + ex);
                ex.printStackTrace();// in ra cac buoc den dau bi loi
            }
        }
        else {// edit
            System.out.println("ok supplier nha");
            Supplier c=this.getSupplierById(supplier.getId());
            c.setSupplierName(supplier.getSupplierName());
            c.setLogoImage(supplier.getLogoImage());
            session.save(c);
            return true;
        }
        return false;
    }

    @Override
    public Supplier getSupplierById(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Supplier s = session.get(Supplier.class, id);
        return s;
    }

    @Override
    public boolean deleteSupplierById(Integer id) {
        Session session=this.sessionFactory.getObject().getCurrentSession();
        Supplier c= this.getSupplierById(id);
        if (this.getSupplierById(id) != null){
            session.delete(c);
            return true;
        }
        return false;
    }
}
