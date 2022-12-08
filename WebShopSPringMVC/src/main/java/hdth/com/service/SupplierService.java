package hdth.com.service;

import hdth.com.model.Supplier;

import java.util.List;

public interface SupplierService {

    List<Supplier> getSuppliers();

    boolean addOrUpdateSuppliers(Supplier supplier);

    Supplier getSupplierById(Integer id);

    boolean deleteSupplierById(Integer id);
}
