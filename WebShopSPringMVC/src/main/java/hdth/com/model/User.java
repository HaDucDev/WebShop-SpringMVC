package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "user")
public class User implements Serializable {

    public static final String ADMIN="ROLE_ADMIN";
    public static final String USER="ROLE_USER";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "first_name")
    private String fisrtName;

    @Column(name = "last_name")
    private String lastName;
    private String email;
    private String phone;
    private String username;
    private String password;

    @Transient
    private String confirmPassword;
    private boolean active;
    @Column(name = "user_role")
    private String userRole;

}
