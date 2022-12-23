package hdth.com.utils.formatter;

import hdth.com.model.Cart;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class CartFomatter implements Formatter<Cart> {

    @Override
    public String print(Cart object, Locale locale) {
        return String.valueOf(object.getId());
    }
    @Override
    public Cart parse(String cateID, Locale locale) throws ParseException {
        Cart c= new Cart();
        c.setId(Integer.parseInt(cateID));
        return c;
    }
}
