package com.xworkz.ecomerceApp.entity;

import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.dto.enums.PaymentMode;
import com.xworkz.ecomerceApp.dto.enums.SameAddress;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@NamedQueries({
        @NamedQuery(name = "getAllCustomer",query = " from AddCustomerEntity"),
        @NamedQuery(name = "getCustomerById",query = "from AddCustomerEntity where id=:id"),
        @NamedQuery(name = "deleteCustomer",query = "delete from AddCustomerEntity  where id=:id"),
//        @NamedQuery(name = "viewCustomerByEmail",query = "from AddCustomerEntity where email=:email")
})
public class AddCustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "customer_type")
    @Enumerated(EnumType.STRING)
    private CustomerType customerType;

    @Column(name = "email")
    private String email;

    @Column(name = "contact_number")
    private String contactNumber;

    @Column(name = "gst_number")
    private String gstNumber;

    @Column(name = "country")
    private String country;

    @Column(name = "state")
    private String state;

    @Column(name = "city")
    private String city;

    @Column(name = "pincode")
    private String pinCode;

    @Column(name = "address")
    private String address;

    @Column(name = "billing_Address")
    private String billingAddress;

    @Column(name = "same_address")
    @Enumerated(EnumType.STRING)
    private SameAddress sameAddress;

    @Column(name = "shipping_Address")
    private String shippingAddress;

    @Column(name = "payment_mode")
    @Enumerated(EnumType.STRING)
    private PaymentMode paymentMode;

}
