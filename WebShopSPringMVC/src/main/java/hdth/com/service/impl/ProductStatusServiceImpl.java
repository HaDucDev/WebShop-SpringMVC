package hdth.com.service.impl;


import hdth.com.model.ProducStatus;
import hdth.com.repository.ProductStatusRepository;
import hdth.com.service.ProductStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductStatusServiceImpl implements ProductStatusService {

    @Autowired
    private ProductStatusRepository  productStatusRepository;

    @Override
    public List<ProducStatus> getProductStatuses() {
        return this.productStatusRepository.getProducStatuses();
    }
}
