package com.kelvin.cms_app.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@Table(name = "cms_voucher")
public class Voucher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private LocalDate expiryDate;

    @Column(length = 999)
    private String imageUrl;

    private BigDecimal amount;

    private String paymentMethod;

    private String status;

    private Integer quantity;

    public Long userid;
}
