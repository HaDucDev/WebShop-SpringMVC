package hdth.com.service.impl;

import hdth.com.model.Supplier;
import hdth.com.repositpry.SupplierRepository;
import hdth.com.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    @Override
    public List<Supplier> getSuppliers() {
        return this.supplierRepository.getSuppliers();
    }

    @Override
    public boolean addOrUpdateSuppliers(Supplier supplier) {
        return false;
    }

    @Override
    public Supplier getSupplierById(Integer id) {
        return null;
    }

    @Override
    public boolean deleteSupplierById(Integer id) {
        return false;
    }
}
