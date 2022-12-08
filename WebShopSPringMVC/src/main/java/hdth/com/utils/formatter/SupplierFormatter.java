package hdth.com.utils.formatter;


import hdth.com.model.Supplier;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class SupplierFormatter implements Formatter<Supplier> {

    @Override
    public String print(Supplier object, Locale locale) {
        return String.valueOf(object.getId());
    }
    @Override
    public Supplier parse(String suppID, Locale locale) throws ParseException {
        Supplier c= new Supplier();
        c.setId(Integer.parseInt(suppID));
        return c;
    }
}
