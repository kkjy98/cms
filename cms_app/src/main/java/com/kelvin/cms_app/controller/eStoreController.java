package com.kelvin.cms_app.controller;

import com.kelvin.cms_app.entity.PaymentHistory;
import com.kelvin.cms_app.entity.Voucher;
import com.kelvin.cms_app.model.VoucherRequest;
import com.kelvin.cms_app.service.eStore.eStoreService;
import com.kelvin.cms_app.service.voucher.VoucherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cms/v1/voucher")
public class eStoreController {

    @Autowired
    VoucherService voucherService;

    @Autowired
    eStoreService eStoreService;


    private static final Logger logger = LoggerFactory.getLogger(eStoreController.class);


    @GetMapping("/list")
    public ResponseEntity<Page<Voucher>> getVCList(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir
    ) {
        Page<Voucher> vouchers = (Page<Voucher>) eStoreService.getVoucherList(page, size, sortBy, sortDir);
        return ResponseEntity.ok(vouchers);
    }

    @GetMapping("/historylist")
    public ResponseEntity<Page<PaymentHistory>> getVCHistory(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir
    ) {
        Page<PaymentHistory> paymentHistoryPage = (Page<PaymentHistory>)eStoreService.getVoucherHistoryList(page, size, sortBy, sortDir);
        return ResponseEntity.ok(paymentHistoryPage);
    }

    @GetMapping("/getVC")
    public ResponseEntity<?> getVCDetails(@RequestParam Long voucherId){

        try {
            ResponseEntity<?> response = eStoreService.getVoucherDetails(voucherId);
            return ResponseEntity.status(HttpStatus.OK).body(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error retrieving voucher: " + e.getMessage());
        }
    }

    @PostMapping("/checkout")
    public  ResponseEntity<?> checkout(@RequestBody VoucherRequest voucherRequest){

        try {
            ResponseEntity<?> response = eStoreService.checkout(voucherRequest);
            return ResponseEntity.status(HttpStatus.OK).body(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error check out: " + e.getMessage());
        }
    }
}
