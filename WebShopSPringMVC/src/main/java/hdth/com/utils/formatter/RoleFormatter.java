package hdth.com.utils.formatter;

import hdth.com.model.Role;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class RoleFormatter implements Formatter<Role> {


    @Override
    public String print(Role object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Role parse(String roleId, Locale locale) throws ParseException {
        Role role= new Role();
        role.setId(Integer.parseInt(roleId));
        return role;
    }
}
