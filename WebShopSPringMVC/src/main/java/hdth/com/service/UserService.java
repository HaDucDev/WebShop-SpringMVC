package hdth.com.service;

import hdth.com.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<User> getUsers();

    List<User> getUsersByUsername(String username);


    // dang ki
    boolean registerUsers(User user);
    boolean addUsers(User user);// them nguoi dung

    boolean editUsers(User user);// sua nguoi dung

    boolean deleteUserById(Integer id);// xoa nguoi dung

    User getUserById(Integer id);

    boolean cofirmPassword(String email);// gui ma ve mail

    boolean cofirmSuccessPassNewSendMail(User  user);// gui ma ve mail

    boolean changeInforUser(Integer userId,User changeInforUser);

    boolean changePassword(User changePasswordRequest);
}
