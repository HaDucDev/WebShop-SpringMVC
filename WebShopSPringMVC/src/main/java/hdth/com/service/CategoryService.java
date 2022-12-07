package hdth.com.service;

import hdth.com.model.Category;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CategoryService {
    List<Category> getCategories();

    boolean addOrUpdateCategories(Category category);

    Category getCategoryById(Integer id);

    boolean deleteCategoryById(Integer id);
}
