package hdth.com.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import hdth.com.utils.enums.ERole;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(length = 20, unique = true)
    private ERole name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "role")
    @JsonIgnore
    private Set<User> users;
}