package hdth.com.service.impl;

import hdth.com.model.User;
import hdth.com.repository.UserRepository;
import hdth.com.service.UserService;
import hdth.com.utils.enums.ERole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> getUsers() {
        return this.userRepository.getUsers();
    }

    @Override
    public List<User> getUsersByUsername(String username) {// ham nay la tim user theo username de dung trong ham load cau hinh
        return this.userRepository.getUsersByUsername(username);
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users= this.getUsersByUsername(username);
        if(users.isEmpty()){
            throw new UsernameNotFoundException("Không tồn tại username");
        }
        User user=users.get(0);
        Set<GrantedAuthority> auth=new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getRole().getName().toString()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),auth);
    }
}
