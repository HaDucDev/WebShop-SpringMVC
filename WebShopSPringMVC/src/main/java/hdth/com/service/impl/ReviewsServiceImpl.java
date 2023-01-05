package hdth.com.service.impl;

import hdth.com.model.Product;
import hdth.com.model.Reviews;
import hdth.com.model.User;
import hdth.com.repository.ProductRepository;
import hdth.com.repository.ReviewsRepository;
import hdth.com.repository.UserRepository;
import hdth.com.service.ReviewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ReviewsServiceImpl implements ReviewsService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReviewsRepository reviewsRepository;

    @Override
    public Reviews addComment(String comment, Integer productId) {
        Product product=this.productRepository.getProductById(productId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = this.userRepository.getUsersByUsername(currentPrincipalName).get(0);

        Reviews reviews= new Reviews();
        reviews.setComment(comment);
        reviews.setProduct(product);
        reviews.setUser(user);
        reviews.setCreatedComment(new Date(System.currentTimeMillis()));

        return this.reviewsRepository.addComment(reviews);
    }
}
