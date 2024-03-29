package hdth.com.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user" ,uniqueConstraints = {
        @UniqueConstraint(name = "unique_username_constraint",columnNames = "username"),
        @UniqueConstraint(name = "unique_email_constraint", columnNames = "email")
})
public class User implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "full_name")
    private String fullName;
    private String email;
    private String phone;
    private String avatar;

    @Column(name = "address_default")
    private String addressDefault;

    private String username;
    private String password;
    @Transient
    private String confirmPassword;// dang ki

    @Transient
    private String oldPassword;// change pass
    @Transient
    private String newPassword;// change pass


    @Column(name = "reset_password_code")
    private String resetPasswordCode;
    @Column(name = "expiration_time_token")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expirationTimeToken;// thoi gian ma token doi mat khau het han

    @Transient
    private MultipartFile avatarImage;
    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "id")// id la ten ben bang cua user
    private Role role;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonIgnore
    private Set<Cart> cart;


    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonIgnore
    private Set<Order> orders;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonIgnore
    private Set<Reviews> reviews;

}