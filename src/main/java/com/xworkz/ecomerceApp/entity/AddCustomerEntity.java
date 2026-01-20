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
        @NamedQuery(
                name = "AddCustomerEntity.existsByEmail", query = "SELECT COUNT(a) FROM AddCustomerEntity a WHERE a.email = :email" ),
        @NamedQuery(
                name = "AddCustomerEntity.existsByPhone",query = "SELECT COUNT(a) FROM AddCustomerEntity a WHERE a.contactNumber = :phone" ),
        @NamedQuery(
                name = "AddCustomerEntity.existsByGst",query = "SELECT COUNT(a) FROM AddCustomerEntity a WHERE a.gstNumber= :gst" ),
        @NamedQuery(
                name = "AddCustomerEntity.existsByName",query = "SELECT COUNT(a) FROM AddCustomerEntity a WHERE a.customerName = :customerName"
        ),
        @NamedQuery(
                name = "AddCustomerEntity.existsByNameAndType", query = "SELECT COUNT(a) FROM AddCustomerEntity a WHERE a.customerName = :customerName AND a.customerType = :customerType"
        ),
        @NamedQuery(
                name = "AddCustomerEntity.findAll",query = "SELECT a FROM AddCustomerEntity a"
        ),
        @NamedQuery(
                name = "AddCustomerEntity.getById", query = "SELECT a FROM AddCustomerEntity a WHERE a.id = :id"
        ),
        @NamedQuery(
                name = "AddCustomerEntity.findByType",query = "SELECT a FROM AddCustomerEntity a WHERE a.customerType = :type"
        ),
        @NamedQuery(name ="getDebtorCustomerTypes",query = "SELECT a FROM AddCustomerEntity a WHERE a.customerType = 'debtor'")
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
