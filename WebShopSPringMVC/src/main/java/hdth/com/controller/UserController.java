package hdth.com.controller;

import hdth.com.model.User;
import hdth.com.service.CartService;
import hdth.com.service.RoleService;
import hdth.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userDetailsService;

    @Autowired
    private CartService cartService;

    //==========================================================================================================> Common
    //register

    @GetMapping("/register")
    public String indexregister(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping("/register")
    private String register(@ModelAttribute User user, Model model) {
        String error = "";
        if (this.userDetailsService.registerUsers(user) == true) {
            String mess = "Chúc mừng bạn đã đăng kí thành công";
            model.addAttribute("successregister", mess);
            return "user/login";
        } else error = "da co loi";
        model.addAttribute("errorregister", error);
        return "user/register";
    }

    // forget password
    @GetMapping("/forget-pass")
    public String indexForgetPass() {
        return "user/forgetPassword";
    }
    //post email. dung jsp sevet, ko dung spring form
    @PostMapping("/forget-pass")
    public String postEmail(@RequestParam("email") String email, Model model) {// model ơ day la dung cho form xac nhan, hung thi la jsp servlet

        if(this.userDetailsService.cofirmPassword(email)==true){// xac nhan va gui email
            //tao doi tuong va gui sang form xac nhan ma
            User user = new User();
            user.setEmail(email);//dat lai  gia tri dung
            model.addAttribute("userForget", user);
            return "user/confirmForgetPass";// nguoi dung se nhap ma o trang nay
        }
        String mess = "Lỗi";
        model.addAttribute("errorEmail",mess);
        return "user/forgetPassword";
    }

    //post de xac nha doi mat khau, mot mat khau moi se gui ve mail
    @PostMapping("/forget-pass-confirm")
    public String postConfirmForget(@ModelAttribute User userForget, Model model) {// model ơ day la dung cho form xac nhan, hung thi la jsp servlet
        if(this.userDetailsService.cofirmSuccessPassNewSendMail(userForget)==true){
            String mess = "Chúc mừng bạn thành công";
            model.addAttribute("successPass",mess);
            return "user/login";
        }
        String mess = "Lỗi";
        model.addAttribute("error",mess);
        return "user/forgetPassword";
    }

    // so luong san pham co trong gio nguoi dung sau khi dang nhap
    @ModelAttribute
    public void commonAtrr(Model model, HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("currentUser");
        if (user != null) {
            System.out.println("00000000000000000000000000");
            model.addAttribute("cartCounter", this.cartService.countProductCartbyUser(user.getId()));
            System.out.println(this.cartService.countProductCartbyUser(user.getId()));
        } else model.addAttribute("cartCounter", 0);
    }


    //=================================================================================================================================> Admin

    @GetMapping("/admin/user-list")
    private String getUserAll(Model model) {
        model.addAttribute("userList", this.userDetailsService.getUsers());
        return "/admin/a-list-user";
    }


    @Autowired
    private RoleService roleService;
    @GetMapping("/admin/add-user")
    private String loadNewUser(Model model) {// du lieu trong de chon form add
        model.addAttribute("accountNew", new User());
        model.addAttribute("roleList",this.roleService.getAllRole());
        return "/admin/b-add-user";
    }

    @PostMapping("/admin/add-user")
    private String addNewUser(@ModelAttribute User accountNew,Model model) {
        if(this.userDetailsService.addUsers(accountNew)==true){
            model.addAttribute("userList", this.userDetailsService.getUsers());
            model.addAttribute("success", "Bạn đã thêm tài khoản thành công");
            return "/admin/a-list-user";// lay du lieu tra ve form
        }
        return "/admin/b-add-user";
    }

    //load thong nguoi dung len sua
    @GetMapping(path = "/admin/user/edit/{id}")
    private String getEdit(@PathVariable(name = "id") Integer id, Model model){
        model.addAttribute("user",this.userDetailsService.getUserById(id));
        model.addAttribute("roleList",this.roleService.getAllRole());//can de load du lieu role
        return "admin/c-edit-user";
    }

    @PostMapping(path = "/admin/user/edit-user")
    private String editUser(@ModelAttribute User user, Model model){
        if(this.userDetailsService.editUsers(user)==true){
            model.addAttribute("userList", this.userDetailsService.getUsers());
            model.addAttribute("success", "Bạn đã sửa thông tin thành công");
            return "/admin/a-list-user";// lay du lieu tra ve form
        }
        return "admin/c-edit-user";
    }


    //====================================================================================================================================> USER
    @GetMapping("/user/account-manager")// thong tin ca nhan loa len de thay doi
    private String getUserByUser(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("currentUser");
        if ( user != null) {
            Integer userId= user.getId();
            model.addAttribute("userinfor", this.userDetailsService.getUserById(userId));
        }
        return "/user/inforUser";
    }



    @PostMapping("/user/account-manager")// thya doi thong tin
    private String EditUserByUser(@ModelAttribute User user, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User usercurrent= (User) session.getAttribute("currentUser");
        if ( user != null && usercurrent !=null) {
            if(this.userDetailsService.changeInforUser(usercurrent.getId(),user)==true){
                model.addAttribute("userinfor", this.userDetailsService.getUserById(usercurrent.getId()));// can goi data the biet da update thanh cong
                model.addAttribute("success", "Cập nhật thành công");
                return "user/inforUser";
            }
        }
        return "/user/inforUser";
    }



}
