package hdth.com.repository;


import hdth.com.model.Supplier;

import java.util.List;

public interface SupplierRepository {
    List<Supplier> getSuppliers();

    boolean addOrUpdateSuppliers(Supplier supplier);

    Supplier getSupplierById(Integer id);

    boolean deleteSupplierById(Integer id);
}
