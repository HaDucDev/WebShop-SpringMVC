package hdth.com.service;


import hdth.com.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {

    List<Product> getProducts();

    //list product co phan trang
    Page<Product> getProductsPaginationFind (Pageable pageable, String text, Integer categoryId, Integer supplierId, String price);

    boolean addOrUpdateProducts(Product product);

    Product getProductById(Integer id);

    boolean deleteProductById(Integer id);
}
