package com.kelvin.cms_app.service.voucher;

import com.kelvin.cms_app.model.VoucherRequest;
import org.springframework.http.ResponseEntity;


public interface VoucherService {

    public ResponseEntity<?> createVoucher(VoucherRequest voucherRequest);

    public ResponseEntity<?> editVoucher(Long voucherID,VoucherRequest voucherRequest);

    public ResponseEntity<?> toggleVoucher(Long voucherID);
}
