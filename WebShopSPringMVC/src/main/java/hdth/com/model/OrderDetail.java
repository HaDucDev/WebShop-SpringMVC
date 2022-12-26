package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class OrderDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer quantity;

    private Long amount;


    //private String isReview;// trạng thái đánh giá sản phẩm được mua. tuc la nguoi dung danh gia san pham nay tai don hang nay ntn

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "order_id", nullable = false, referencedColumnName = "id")
    private Order order;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "product_id", nullable = false, referencedColumnName = "id")
    private Product product;
}
