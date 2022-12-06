package hdth.com.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table
public class Cart  implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)// id tự tăng
    private Integer id;
    private Integer quantity;// so luong san pham dat mua

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false, referencedColumnName = "id", insertable = false, updatable =
            false)
    private User user;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id", nullable = false, referencedColumnName = "id", insertable = false,
            updatable = false)
    private Product product;
}
