package com.kelvin.cms_app.repository;

import com.kelvin.cms_app.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface VoucherRepository extends JpaRepository<Voucher,Long> {

    @Modifying
    @Transactional
    @Query(value = "UPDATE cms_voucher SET image_url = :url WHERE id = :id", nativeQuery = true)
    int updateQRcode(@Param("url") String imageUrl, @Param("id") Long id);

}
