package hdth.com.repository;

import hdth.com.model.Role;
import hdth.com.utils.enums.ERole;

import java.util.List;

public interface RoleRepository {

    Role findByName(ERole name);

    List<Role> getAllRole();
}
