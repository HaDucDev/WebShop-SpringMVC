package hdth.com.repository;

import hdth.com.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductRepository {

    List<Product> getProducts();

    List<Product> getProductsText(String text);


    boolean addOrUpdateProducts(Product product);

    Product getProductById(Integer id);

    boolean deleteProductById(Integer id);
}
