package hdth.com.repository;

import hdth.com.model.Product;
import hdth.com.model.User;

import java.util.List;

public interface UserRepository {
    List<User> getUsers();
    List<User> getUsersByUsername(String username);
    boolean addOrUpdateUsers(User user);// dang ki, them , sua
    User getUserById(Integer id);// lay nguoi dung theo id dung o phan them gio hang


    boolean changePassword(User changePasswordRequest);
}
