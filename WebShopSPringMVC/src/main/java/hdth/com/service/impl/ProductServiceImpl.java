package hdth.com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import hdth.com.model.Product;
import hdth.com.model.Supplier;
import hdth.com.repository.ProductRepository;
import hdth.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Product> getProducts() {
        return this.productRepository.getProducts();
    }


//    public Page<Product> getProductsPagination(Pageable pageable) {
//        int pageSize = pageable.getPageSize();// dat dau tu 1
//        int currentPage = pageable.getPageNumber();// bat dau tu 0
//        int startItem = currentPage * pageSize;//0
//        List<Product> productList = this.productRepository.getProducts();
//        List<Product> productPage =  new ArrayList<>();
//
//        for(int i= startItem; i<startItem+pageSize && i< productList.size();i++){
//            productPage.add(productList.get(i));
//        }
//        return new PageImpl<>(productPage, PageRequest.of(currentPage, pageSize), productList.size());
//    }

    @Override
    public Page<Product> getProductsPaginationFind(Pageable pageable, String text, Integer categoryId, Integer supplierId, Integer startPrice, Integer endPrice) {
        int pageSize = pageable.getPageSize();// dat dau tu 1
        int currentPage = pageable.getPageNumber();// bat dau tu 0
        int startItem = currentPage * pageSize;//0
        List<Product> productList = this.productRepository.getProductsFilter(text,categoryId,supplierId,startPrice,endPrice);
        List<Product> productPage =  new ArrayList<>();
        for(int i= startItem; i<startItem+pageSize && i< productList.size();i++){
            productPage.add(productList.get(i));
        }
        return new PageImpl<>(productPage, PageRequest.of(currentPage, pageSize), productList.size());
    }

    @Override
    public boolean addOrUpdateProducts(Product product) {

        if (product.getProductFile() != null && (!product.getProductFile().isEmpty())) {
            try {
                System.out.println(product.getProductFile());
                Map p = this.cloudinary.uploader().upload(product.getProductFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                String img = (String) p.get("secure_url");
                if(img == null){
                    System.out.println(product.getProductName());
                }
                product.setProductImage(img);
                System.out.println(product.getProductName()+ "ok roi chu dm");
                return this.productRepository.addOrUpdateProducts(product);
            }
            catch (IOException e) {
                System.out.println("loi post add supplier" + e.getMessage());
            }

        }
        if (product.getProductFile() == null || (product.getProductFile().isEmpty()))
        {
            if(product.getId() == null){
                String image= "https://res.cloudinary.com/dkdyl2pcy/image/upload/v1670464883/samples/avatar_icon_lo4bff.png";
                product.setProductImage(image);
                return this.productRepository.addOrUpdateProducts(product);
            }
            else {
                Product s= this.getProductById(product.getId());
                String imageDefault= s.getProductImage();
                product.setProductImage(imageDefault);
                return this.productRepository.addOrUpdateProducts(product);
            }
        }
        return false;
    }

    @Override
    public Product getProductById(Integer id) {
        return this.productRepository.getProductById(id);
    }

    @Override
    public boolean deleteProductById(Integer id) {
        return false;
    }
}
