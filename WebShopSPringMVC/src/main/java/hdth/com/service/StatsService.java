package hdth.com.service;

import java.util.Date;
import java.util.List;

public interface StatsService {

    List<Object[]> cateStats();

    List<Object[]> productStats(String kw, Date fromdate, Date toDate);
}
