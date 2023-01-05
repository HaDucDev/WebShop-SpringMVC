package hdth.com.service.impl;

import hdth.com.repository.StatsRepository;
import hdth.com.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatsServiceImpl implements StatsService {

    @Autowired
    private StatsRepository statsRepository;

    @Override
    public List<Object[]> cateStats() {
        return this.statsRepository.cateStats();
    }
}
