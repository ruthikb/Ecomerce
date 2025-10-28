package com.xworkz.ecomerceApp.dto;

import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.dto.enums.PaymentMode;
import com.xworkz.ecomerceApp.dto.enums.SameAddress;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddCustomerDto {

    @NotEmpty(message = "Customer name cannot be empty")
    @Size(max = 100, message = "Customer name should not exceed 100 characters")
    private String customerName;

    @NotNull(message = "Customer type cannot be null")
    private CustomerType customerType;

    @Email(message = "Invalid email format")
    @NotEmpty(message = "Email cannot be empty")
    @Size(max = 150, message = "Email should not exceed 150 characters")
    private String email;

    @Pattern(regexp = "^[0-9]{10}$", message = "Contact number should be exactly 10 digits")
    private String contactNumber;

    @Pattern(regexp = "^[A-Z0-9]{15}$", message = "GST number should be exactly 15 characters")
    private String gstNumber;

    @NotEmpty(message = "Country cannot be empty")
    private String country;

    @NotEmpty(message = "State cannot be empty")
    private String state;

    @NotEmpty(message = "City cannot be empty")
    private String city;

    @Pattern(regexp = "^[0-9]{6}$", message = "Pin code should be exactly 6 digits")
    private String pinCode;

    @NotEmpty(message = "Address cannot be empty")
    @Size(max = 255, message = "Address should not exceed 255 characters")
    private String address;

    @Size(max = 255, message = "Billing address should not exceed 255 characters")
    private String billingAddress;

    private SameAddress sameAddress;

    @Size(max = 255, message = "Shipping address should not exceed 255 characters")
    private String shippingAddress;

    @NotNull(message = "Payment mode cannot be null")
    private PaymentMode paymentMode;
}
