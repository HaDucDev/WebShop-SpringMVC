package hdth.com.repository;

import java.util.Date;
import java.util.List;

public interface StatsRepository {

    List<Object[]> cateStats();// thong ke so san pham theo cate
    List<Object[]> productStats(String kw, Date fromdate, Date toDate);// thong ke doanh thu theo san pham
}
