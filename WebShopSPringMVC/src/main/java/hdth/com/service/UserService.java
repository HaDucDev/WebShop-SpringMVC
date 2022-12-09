package hdth.com.service;

import hdth.com.model.User;

import java.util.List;

public interface UserService {
    List<User> getUsers();

    List<User> getUsersByUsername(String username);
}
