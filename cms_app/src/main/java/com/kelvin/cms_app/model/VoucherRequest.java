package com.kelvin.cms_app.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL) // Ignore null fields in JSON
public class VoucherRequest {

    private String title;
    private String description;

    @JsonFormat(pattern = "dd-MM-yyyy") // Ensures JSON date conversion
    private LocalDate expiryDate;

    private String imageUrl;
    private BigDecimal amount;
    private String paymentMethod;
    private Integer quantity;
    private String buyType;  // "MYSELF_ONLY" or "GIFT_TO_OTHERS"

    // Fields for "MYSELF_ONLY"
    private String buyerName;
    private String buyerPhone;
}
