package hdth.com.service;

import hdth.com.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<User> getUsers();

    List<User> getUsersByUsername(String username);


    // dang ki, them , sua user
    boolean addOrUpdateUsers(User user);


    User getUserById(Integer id);
}
