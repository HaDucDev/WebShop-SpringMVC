package hdth.com.service.impl;


import hdth.com.model.Role;
import hdth.com.repository.RoleRepository;
import hdth.com.service.RoleService;
import hdth.com.utils.enums.ERole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public Role findByName(ERole name) {
        return this.roleRepository.findByName(name);
    }

    @Override
    public List<Role> getAllRole() {
        return this.roleRepository.getAllRole();
    }
}
