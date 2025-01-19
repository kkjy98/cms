package com.kelvin.cms_app.model;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CheckoutResponse {

    String imageUrl;
    private BigDecimal amount;
    String message;
}
