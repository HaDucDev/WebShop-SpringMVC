package hdth.com.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
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


    @Column(name = "status_order")
    private String statusOrder;// trạng thai don hang. chua duyet, da duyet, dang giao , da gioa hang

    //private Integer shipperId;

    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
   // @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdDate;// ngay tao don hang


    @Column(name = "receipt_user")
    private String receiptUser;// ten nguoi nhan don hang


    @Transient
    private Integer methodPayment;// 0 la Cod. con 1 laf MoMo

    @Column(name = "receipt_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date receiptDate;// ngay tao don hang

    @OneToMany( mappedBy = "order",fetch = FetchType.EAGER)
    private Set<OrderDetail> orderDetails;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id",nullable = false,referencedColumnName = "id")
    private User user;



}
