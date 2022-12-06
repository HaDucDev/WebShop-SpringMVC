package hdth.com.repositpry;


import hdth.com.model.Category;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface CategoryRepository {
    List<Category> getCategories();
}
