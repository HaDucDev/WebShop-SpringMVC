package hdth.com.service.impl;

import hdth.com.model.Product;
import hdth.com.repository.ProductRepository;
import hdth.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getProducts() {
        return this.productRepository.getProducts();
    }

    @Override
    public boolean addOrUpdateProducts(Product product) {
        return false;
    }

    @Override
    public Product getProductById(Integer id) {
        return null;
    }

    @Override
    public boolean deleteProductById(Integer id) {
        return false;
    }
}
