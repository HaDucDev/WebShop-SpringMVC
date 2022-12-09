package hdth.com.service.impl;

import hdth.com.model.User;
import hdth.com.repository.UserRepository;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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


}
