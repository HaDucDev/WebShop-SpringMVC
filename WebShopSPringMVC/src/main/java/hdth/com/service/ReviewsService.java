package hdth.com.service;

import hdth.com.model.Reviews;

public interface ReviewsService {

    Reviews addComment(String comment, Integer productId);
}
