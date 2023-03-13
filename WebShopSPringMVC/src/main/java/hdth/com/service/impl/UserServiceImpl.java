package hdth.com.service.impl;

import hdth.com.config.sendMail.EmailService;
import hdth.com.model.Role;
import hdth.com.model.User;
import hdth.com.repository.UserRepository;
import hdth.com.service.RoleService;
import hdth.com.service.UserService;
import hdth.com.utils.common.Utils;
import hdth.com.utils.enums.ERole;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private RoleService roleService;

    @Override
    public List<User> getUsers() {
        return this.userRepository.getUsers();
    }

    @Override
    public List<User> getUsersByUsername(String username) {// ham nay la tim user theo username de dung trong ham load cau hinh
        return this.userRepository.getUsersByUsername(username);
    }

    @Override
    public boolean addOrUpdateUsers(User user) {

        String pass= user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));

        String avatar= "https://res.cloudinary.com/dkdyl2pcy/image/upload/v1670464883/samples/avatar_icon_lo4bff.png";
        if(user.getAvatar() == null || (user.getAvatar().isEmpty())){
            user.setAvatar(avatar);
        }
        Role role=this.roleService.findByName(ERole.ROLE_USER);
        user.setRole(role);
        return this.userRepository.addOrUpdateUsers(user);
    }

    @Override
    public User getUserById(Integer id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users= this.getUsersByUsername(username);
        if(users.isEmpty()){
            System.out.println("vo list trong day");
            throw new UsernameNotFoundException("Không tồn tại username");
        }
        User user=users.get(0);
        Set<GrantedAuthority> auth=new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getRole().getName().toString()));
        return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),auth);
    }


    //================================> USER

    @Override
    public boolean changePassword(User changePasswordRequest) {
        return this.userRepository.changePassword(changePasswordRequest);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.getUserByEmail(email);
    }
    @Autowired
    private EmailService emailService;
    @Override
    public boolean cofirmPassword(String email) {
        User userData = this.getUserByEmail(email);
        if(userData!=null){
            String textCode = Utils.getRandomNumber(9);
            userData.setResetPasswordCode(textCode);
            // thoi gian het han
            Date expirationTime = new Date(System.currentTimeMillis() + 10 * 60 * 1000); // thêm 10 phút
            userData.setExpirationTimeToken(expirationTime);
            if(this.userRepository.updateUsers(userData)==true){

                String toEmail = userData.getEmail();
                String subject = "Mã xác nhận quên mật khẩu";
                String message = "Chào mừng quý khách đến với SHOP. Đây là mã xác nhận của bạn của bạn: " + textCode +". Sau 10 phút sẽ hết hạn";
                try {
                    this.emailService.sendEmail(toEmail, subject, message);// gui mail
                    return  true;
                } catch (EmailException | MessagingException e) {
                    System.out.println("Ngoại lệ xảy ra khi gửi email");
                    return false;
                }
            }
            return  false;
        }
        return false;
    }

    @Override
    public boolean cofirmSuccessPassNewSendMail(User user) {// xac nhan thanh cong mat khau ms ve mail
        User userData = this.getUserByEmail(user.getEmail());

        // lay thoi gian thuc hien xac nhan
        Date currentDate = new Date(System.currentTimeMillis());
        //lay thoi gian trong csdl len de kiem tra
        Date dateExpiration = userData.getExpirationTimeToken();

        if(userData!=null && user.getResetPasswordCode().equals(userData.getResetPasswordCode()) && currentDate.compareTo(dateExpiration)<0){
            String textCode = Utils.getRandomNumber(8)+"ok";//tao mat kahu ms
            userData.setPassword(this.passwordEncoder.encode(textCode));
            if(this.userRepository.updateUsers(userData)==true){
                String toEmail = userData.getEmail();
                String subject = "Mã xác nhận quên mật khẩu";
                String message = "Chào mừng quý khách đến với SHOP. Mật khẩu mởi của bạn là: " + textCode +". Hãy đăng nhập và đổi mật khẩu nhé";
                try {
                    this.emailService.sendEmail(toEmail, subject, message);// gui mail
                    return  true;
                } catch (EmailException | MessagingException e) {
                    System.out.println("Ngoại lệ xảy ra khi gửi email mật khẩu mới");
                    return false;
                }
            }
            return  false;
        }
        return false;
    }
}
