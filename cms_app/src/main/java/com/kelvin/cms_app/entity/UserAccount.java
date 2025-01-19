package com.kelvin.cms_app.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@Table(name = "cms_useraccount")
public class UserAccount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    private String name;
    private String phonenumber;

    @Enumerated(EnumType.STRING)
    private BuyType buyType;

    @Column(name = "purchase_limit") // Avoid using reserved keywords
    private Integer purchaseLimit;

    @Column(name = "gift_limit")
    private Integer giftLimit;


    public enum BuyType {
        MYSELF_ONLY,
        GIFT_TO_OTHERS
    }
}

