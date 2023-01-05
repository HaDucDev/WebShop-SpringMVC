
package hdth.com.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "product_name")
    private String productName;

    private Integer quantity;// so luong san pham con trong kho

    @Transient
    private MultipartFile productFile;

    @Column(name = "product_image")
    private String productImage;

    private Integer discount;

    @Column(name = "unit_price")
    private Integer unitPrice;// gia ban dau

    @Column(name = "description_product")
    private String descriptionProduct;


    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "category_id",referencedColumnName = "id")
    private Category category;


    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "supplier_id",referencedColumnName = "id")
    private Supplier supplier;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private Set<Cart> cart;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    @JsonIgnore
    private Set<OrderDetail> orderDetails;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER)// mac dinh se ko goi list. nên can sua
    @JsonIgnore
    @OrderBy("createdComment DESC ")
    private Set<Reviews> reviews;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "producstatus_id",referencedColumnName = "id")
    private ProducStatus productstatus;

}

