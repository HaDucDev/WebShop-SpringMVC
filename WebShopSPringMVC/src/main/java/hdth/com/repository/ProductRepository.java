package hdth.com.repository;

import hdth.com.model.Product;

import java.util.List;

public interface ProductRepository {

    List<Product> getProducts();

    boolean addOrUpdateProducts(Product product);

    Product getProductById(Integer id);

    boolean deleteProductById(Integer id);
}
