package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Reviews implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String comment;

    //private Integer rating;// lượt đánh giá của khách hàng

    @Column(name = "created_comment")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdComment;

//    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
//    @JoinColumn(name = "orders_id", nullable = false,referencedColumnName = "orders_id",insertable=false, updatable=false)
//    private Order orders;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn (name = "product_id", nullable = false,referencedColumnName = "id",insertable=false, updatable=false)
    private Product product;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id",nullable = false,referencedColumnName = "id",insertable = false,updatable = false)
    private User user;


}
