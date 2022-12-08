package hdth.com.utils.formatter;

import hdth.com.model.Category;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class CategoryFomatter implements Formatter<Category> {
    @Override
    public String print(Category object, Locale locale) {
        return String.valueOf(object.getId());
    }
    @Override
    public Category parse(String cateID, Locale locale) throws ParseException {
        Category c= new Category();
        c.setId(Integer.parseInt(cateID));
        return c;
    }
}
