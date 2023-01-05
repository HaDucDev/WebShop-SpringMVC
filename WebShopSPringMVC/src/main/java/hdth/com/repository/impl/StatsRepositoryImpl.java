package hdth.com.repository.impl;


import hdth.com.model.Category;
import hdth.com.model.Product;
import hdth.com.repository.StatsRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> cateStats() {
        Session session= this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder a = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q= a.createQuery(Object[].class);

        // join 2 bang cate va product can co 2 root tuong ung
        Root rootP=q.from(Product.class);
        Root rootC = q.from(Category.class);
         // dieu kien de join 2 table. khoa ngoai va khoa chinh trung nhau. o product thi khoa ngoai la doi tuong category day
        q.where(a.equal(rootP.get("category"),rootC.get("id")));
        q.multiselect(rootC.get("id"),rootC.get("name"),a.count(rootP.get("id")));
        q.groupBy(rootC.get("id"));// gom nhom theo id cua cate

        // tao cau truy van
        Query query= session.createQuery(q);
        return query.getResultList();
    }
}
