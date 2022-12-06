package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @Column(name = "delivery_address")
    private String deliveryAddress;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "total_amount")
    private Long totalAmount;

    @Column(name = "payment_status")
    private String paymentStatus;// trang thai thanh toan

    private String statusOrder;// trạng thai don hang. chua duyet, da duyet, dang giao , da gioa hang

    //private Integer shipperId;

    @Column(name = "created_date")
    @Temporal(TemporalType.DATE)
    private Date createdDate;// ngay tao don hang


    @Column(name = "receipt_date")
    @Temporal(TemporalType.DATE)
    private Date receiptDate;// ngay tao don hang

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
    private Set<OrderDetail> orderDetails;

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orders")
//    private Set<Reviews> reviewsEntities;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false, referencedColumnName = "id", insertable = false, updatable = false)
    private User user;
}
