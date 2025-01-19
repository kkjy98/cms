package com.kelvin.cms_app.controller;

import com.kelvin.cms_app.model.VoucherRequest;
import com.kelvin.cms_app.service.voucher.VoucherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cms/v1/voucher")
public class VoucherController {

    @Autowired
    VoucherService voucherService;

    private static final Logger logger = LoggerFactory.getLogger(VoucherController.class);

    @PostMapping("/addVC")
    public ResponseEntity<?> createVoucher(@RequestBody VoucherRequest voucherRequest){

        logger.info("Received request for creating voucher");
        try {
            ResponseEntity<?> response = voucherService.createVoucher(voucherRequest);
            return response;
        } catch (Exception e) {
            logger.error("Error creating voucher: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create voucher.");
        }
    }

    @PutMapping("/editVC/{voucherId}")
    public ResponseEntity<?> editVoucher(@PathVariable Long voucherId, @RequestBody VoucherRequest voucherRequest) {
        try {

            ResponseEntity<?> response = voucherService.editVoucher(voucherId, voucherRequest);
            return ResponseEntity.status(HttpStatus.OK).body(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating voucher: " + e.getMessage());
        }
    }

    @PutMapping("/toggleVC/{voucherId}")
    public ResponseEntity<?> toggleVoucher(@PathVariable Long voucherId) {
        try {

            ResponseEntity<?> response = voucherService.toggleVoucher(voucherId);
            return ResponseEntity.status(HttpStatus.OK).body(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating voucher: " + e.getMessage());
        }
    }
}
