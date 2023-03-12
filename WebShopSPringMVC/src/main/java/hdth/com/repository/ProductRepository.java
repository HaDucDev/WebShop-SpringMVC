package hdth.com.repository;

import hdth.com.model.Product;

import java.util.List;

public interface ProductRepository {

    List<Product> getProducts();

    List<Product> getProductsFilter(String text, Integer categoryId, Integer supplierId, Integer startPrice, Integer endPrice);


    boolean addOrUpdateProducts(Product product);

    Product getProductById(Integer id);

    boolean deleteProductById(Integer id);
}
