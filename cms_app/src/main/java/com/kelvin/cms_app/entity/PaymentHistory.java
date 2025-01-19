package com.kelvin.cms_app.entity;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@Table(name = "cms_history")
public class PaymentHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long user_id;
    private Long voucher_id;
    @Column(length = 999)
    private String qr_string;
}
