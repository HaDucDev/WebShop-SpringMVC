package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "`order`")
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
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;// ngay tao don hang

    @Column(name = "receipt_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date receiptDate;// ngay tao don hang

    @OneToMany( mappedBy = "order",fetch = FetchType.EAGER)
    private Set<OrderDetail> orderDetails;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id",nullable = false,referencedColumnName = "id",insertable = false,updatable = false)
    private User user;


}
