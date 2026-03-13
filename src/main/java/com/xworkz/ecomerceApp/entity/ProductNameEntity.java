package com.xworkz.ecomerceApp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.GeneratorType;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@NamedQueries({
//        @NamedQuery(name = "isProductNameExists",query = "from ProductNameEntity  where productName=:productName"),
       @NamedQuery(name = "getNameById",query = "from ProductNameEntity where id=:id"),
        @NamedQuery(name = "getAllProductNames",query = "from ProductNameEntity"),
        @NamedQuery(name = "getAllProductNamesOnly",query = "select p.productName from ProductNameEntity p"),
//        @NamedQuery(name = "getAllProductNames",query = "SELECT p.productName FROM ProductNameEntity p")
})
public class ProductNameEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;

    private String productName;
}
