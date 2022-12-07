package hdth.com.repositpry;


import hdth.com.model.Category;

import java.util.List;


public interface CategoryRepository {
    List<Category> getCategories();

    boolean addOrUpdateCategories(Category category);

    Category getCategoryById(Integer id);

    boolean deletecategoryById(Integer id);
}
