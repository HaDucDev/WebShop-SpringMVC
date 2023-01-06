package hdth.com.repository.impl;


import hdth.com.model.Category;
import hdth.com.model.Order;
import hdth.com.model.OrderDetail;
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
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> cateStats() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder a = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = a.createQuery(Object[].class);

        // join 2 bang cate va product can co 2 root tuong ung
        Root rootP = q.from(Product.class);
        Root rootC = q.from(Category.class);
        // dieu kien de join 2 table. khoa ngoai va khoa chinh trung nhau. o product thi khoa ngoai la doi tuong category day
        q.where(a.equal(rootP.get("category"), rootC.get("id")));
        q.multiselect(rootC.get("id"), rootC.get("name"), a.count(rootP.get("id")));
        q.groupBy(rootC.get("id"));// gom nhom theo id cua cate

        // tao cau truy van
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> productStats(String kw, Date fromdate, Date toDate) {
        // kw: vi chi muon thong ke mot san pham bat ki thoi  khong thong ke list toan

        System.out.println(fromdate);
        System.out.println(toDate);
        Session session = this.sessionFactory.getObject().getCurrentSession();// lenh truy van db
        CriteriaBuilder a = session.getCriteriaBuilder();// field query
        CriteriaQuery<Object[]> q = a.createQuery(Object[].class);// model truy van

        // join 2 bang cate va product can co 2 root tuong ung
        Root rootP = q.from(Product.class);
        Root rootO = q.from(Order.class);
        Root rootD = q.from(OrderDetail.class);

        //list dieu kien ket noi
        List<Predicate> predicates = new ArrayList<>();// list bieu thuc vi tu
        predicates.add(a.equal(rootD.get("product"), rootP.get("id")));// thuoc tinh dung vs o model
        predicates.add(a.equal(rootD.get("order"), rootO.get("id")));// vi tu join 2 bang

        // prod nhan 2 field trong csdl, con nhan 2 so thi binh thuong
        q.multiselect(rootP.get("id"), rootP.get("productName"), a.sum(a.prod(rootP.get("unitPrice"), rootD.get("quantity"))));

        if (kw != null && !kw.isEmpty()) {
            predicates.add(a.like(rootP.get("productName"), String.format("%%%s%%", kw)));
        }

        if (fromdate != null) {// greaterThanOrEqualTo(): lon hon hoac bang
            predicates.add(a.greaterThanOrEqualTo(rootO.get("createdDate"), fromdate));
        }

        if (toDate != null) {// lessThanOrEqualTo: nho hon hoac bang
            predicates.add(a.lessThanOrEqualTo(rootO.get("createdDate"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(rootP.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> productMonthStats(String kw, Date fromdate, Date toDate) {
        // kw: vi chi muon thong ke mot san pham bat ki thoi  khong thong ke list toan

        System.out.println(fromdate);
        System.out.println(toDate);
        Session session = this.sessionFactory.getObject().getCurrentSession();// lenh truy van db
        CriteriaBuilder a = session.getCriteriaBuilder();// field query
        CriteriaQuery<Object[]> q = a.createQuery(Object[].class);// model truy van

        // join 2 bang cate va product can co 2 root tuong ung
        Root rootP = q.from(Product.class);
        Root rootO = q.from(Order.class);
        Root rootD = q.from(OrderDetail.class);

        //list dieu kien ket noi
        List<Predicate> predicates = new ArrayList<>();// list bieu thuc vi tu
        predicates.add(a.equal(rootD.get("product"), rootP.get("id")));// thuoc tinh dung vs o model
        predicates.add(a.equal(rootD.get("order"), rootO.get("id")));// vi tu join 2 bang

        // prod nhan 2 field trong csdl, con nhan 2 so thi binh thuong
        q.multiselect(
                a.function("MONTH", Integer.class, rootO.get("createdDate")),
                a.function("YEAR", Integer.class, rootO.get("createdDate")),
                a.sum(a.prod(rootP.get("unitPrice"), rootD.get("quantity")))
        );
        if (kw != null && !kw.isEmpty()) {
            predicates.add(a.like(rootP.get("productName"), String.format("%%%s%%", kw)));
        }

        if (fromdate != null) {// greaterThanOrEqualTo(): lon hon hoac bang
            predicates.add(a.greaterThanOrEqualTo(rootO.get("createdDate"), fromdate));
        }
        if (toDate != null) {// lessThanOrEqualTo: nho hon hoac bang
            predicates.add(a.lessThanOrEqualTo(rootO.get("createdDate"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(a.function("MONTH", Integer.class, rootO.get("createdDate")),
                a.function("YEAR", Integer.class, rootO.get("createdDate")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
