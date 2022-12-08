package hdth.com.service.impl;

import hdth.com.model.Category;
import hdth.com.repository.CategoryRepository;
import hdth.com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategotyServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;


    @Override
    public List<Category> getCategories() {
        return this.categoryRepository.getCategories();
    }

    @Override
    public boolean addOrUpdateCategories(Category category) {
        return this.categoryRepository.addOrUpdateCategories(category);
    }

    @Override
    public Category getCategoryById(Integer id) {
        return this.categoryRepository.getCategoryById(id);
    }

    @Override
    public boolean deleteCategoryById(Integer id) {
        return this.categoryRepository.deletecategoryById(id);
    }


}
