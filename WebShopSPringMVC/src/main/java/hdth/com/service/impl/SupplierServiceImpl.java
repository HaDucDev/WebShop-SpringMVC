package hdth.com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import hdth.com.model.Supplier;
import hdth.com.repositpry.SupplierRepository;
import hdth.com.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Supplier> getSuppliers() {
        return this.supplierRepository.getSuppliers();
    }

    @Override
    public boolean addOrUpdateSuppliers(Supplier supplier) {

        System.out.println(supplier.getFile());
        if (supplier.getFile() != null && (!supplier.getFile().isEmpty())) {
            try {
                System.out.println(supplier.getSupplierName());
                Map p = this.cloudinary.uploader().upload(supplier.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                String img = (String) p.get("secure_url");
                if(img == null){
                    System.out.println(supplier.getSupplierName());
                }
                supplier.setLogoImage(img);
                System.out.println(supplier.getSupplierName()+ "ok roi chu dm");
                return this.supplierRepository.addOrUpdateSuppliers(supplier);
            }
            catch (IOException e) {
                System.out.println("loi post add produc" + e.getMessage());
            }

        }
        if (supplier.getFile() == null || (supplier.getFile().isEmpty()))
        {
            String image= "https://res.cloudinary.com/dkdyl2pcy/image/upload/v1670464883/samples/avatar_icon_lo4bff.png";
            supplier.setLogoImage(image);
            return this.supplierRepository.addOrUpdateSuppliers(supplier);
        }
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
