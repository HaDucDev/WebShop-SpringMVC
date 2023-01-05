package hdth.com.controller.restAPI;


import hdth.com.model.Reviews;
import hdth.com.service.ReviewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ReviewsControllerREST {

    @Autowired
    private ReviewsService reviewsService;

    @PostMapping("/user/add-comment")
    public ResponseEntity<Reviews> addComment(@RequestBody Map<String, String> params){
        try {
            //String comment=params.getOrDefault("content","");// neu co thi lay thuoc tinh content khong thi lay ""
            String comment=params.get("content");
            Integer productId=Integer.parseInt(params.get("productId"));

            Reviews reviews=this.reviewsService.addComment(comment,productId);
            return new ResponseEntity<>(reviews,HttpStatus.OK);

        }
        catch (Exception e){// neu du lieu lay khong co
            e.printStackTrace();
        }
        return new  ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
