package hdth.com.service;

import hdth.com.model.Role;
import hdth.com.utils.enums.ERole;

import java.util.List;

public interface RoleService {

    Role findByName(ERole name);

    List<Role> getAllRole();
}
