package com.kelvin.cms_app.repository;

import com.kelvin.cms_app.entity.PaymentHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryRepository extends JpaRepository<PaymentHistory,Long> {
}
