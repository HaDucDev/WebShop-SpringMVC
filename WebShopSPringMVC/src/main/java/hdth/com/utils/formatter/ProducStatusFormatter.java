package hdth.com.utils.formatter;

import hdth.com.model.ProducStatus;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class ProducStatusFormatter implements Formatter<ProducStatus> {
    @Override
    public String print(ProducStatus object, Locale locale) {
        return String.valueOf(object.getId());
    }
    @Override
    public ProducStatus parse(String psID, Locale locale) throws ParseException {
        ProducStatus c= new ProducStatus();
        c.setId(Integer.parseInt(psID));
        return c;
    }
}
