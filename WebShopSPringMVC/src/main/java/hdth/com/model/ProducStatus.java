package hdth.com.model;


import hdth.com.utils.enums.EStatusProduct;
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
public class ProducStatus implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(length = 20, unique = true)
    private EStatusProduct name;


    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productstatus")
    private Set<Product> products;
}
