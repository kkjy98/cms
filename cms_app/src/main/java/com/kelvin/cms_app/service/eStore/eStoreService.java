package com.kelvin.cms_app.service.eStore;

import com.kelvin.cms_app.entity.PaymentHistory;
import com.kelvin.cms_app.entity.Voucher;
import com.kelvin.cms_app.model.VoucherRequest;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;

public interface eStoreService {

    public Page<Voucher> getVoucherList(int page, int size, String sortBy, String sortDir);

    public Page<PaymentHistory> getVoucherHistoryList(int page, int size, String sortBy, String sortDir);

    public ResponseEntity<?> getVoucherDetails(Long voucherId);

    public ResponseEntity<?> checkout(VoucherRequest voucherRequest);
}

