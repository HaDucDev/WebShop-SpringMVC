package hdth.com.repositpry;

import hdth.com.model.Category;
import hdth.com.model.Supplier;

import java.util.List;

public interface SupplierRepository {
    List<Supplier> getSuppliers();

    boolean addOrUpdateSuppliers(Supplier supplier);

    Category getSupplierById(Integer id);

    boolean deleteSupplierById(Integer id);
}
