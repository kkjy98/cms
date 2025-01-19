package com.kelvin.cms_app.service.eStore;

import com.kelvin.cms_app.entity.PaymentHistory;
import com.kelvin.cms_app.entity.UserAccount;
import com.kelvin.cms_app.entity.Voucher;
import com.kelvin.cms_app.model.ApiResponse;
import com.kelvin.cms_app.model.CheckoutResponse;
import com.kelvin.cms_app.model.VoucherRequest;
import com.kelvin.cms_app.repository.HistoryRepository;
import com.kelvin.cms_app.repository.VoucherRepository;
import com.kelvin.cms_app.service.keycloak.KeycloakServiceImpl;
import com.kelvin.cms_app.service.voucher.VoucherService;
import com.kelvin.cms_app.util.QRUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Service
public class eStoreServiceImpl implements eStoreService{

    @Autowired
    private VoucherRepository voucherRepository;
    @Autowired
    private VoucherService voucherService;
    @Autowired
    private HistoryRepository historyRepository;

    private static final Logger logger = LoggerFactory.getLogger(eStoreServiceImpl.class);;



    public Page<Voucher> getVoucherList(int page, int size, String sortBy, String sortDir) {
        Sort sort = sortDir.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        return voucherRepository.findAll(pageable);
    }

    @Override
    public Page<PaymentHistory> getVoucherHistoryList(int page, int size, String sortBy, String sortDir) {
        Sort sort = sortDir.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        return historyRepository.findAll(pageable);
    }

    @Override
    public ResponseEntity<?> getVoucherDetails(Long voucherId) {
        ApiResponse apiResponse = new ApiResponse();
        // Find the voucher by ID
        Optional<Voucher> existingVoucher = voucherRepository.findById(voucherId);

        if (existingVoucher.isPresent()){
            apiResponse.setStatus("1000");
            apiResponse.setData(existingVoucher);
            return ResponseEntity.ok(apiResponse);
        }else {
            apiResponse.setStatus("404");
            apiResponse.setMessage("Voucher not found with ID: " + voucherId);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(apiResponse);
        }
    }

    @Override
    public ResponseEntity<?> checkout(VoucherRequest voucherRequest) {
        CheckoutResponse checkoutResponse = new CheckoutResponse();
        QRUtil qr = new QRUtil();
        Long voucherId = null;
        Long userid = null;
        String qr_string = null;
        try {
            ResponseEntity<?> response = voucherService.createVoucher(voucherRequest);

            if (response.getStatusCode().is2xxSuccessful()) {
                // Retrieve the ApiResponse body
                ApiResponse responseBody = (ApiResponse) response.getBody();

                // Cast the data to Voucher object
                Voucher voucher = (Voucher) responseBody.getData();  // Cast 'data' to Voucher

                // Retrieve the ID from the voucher
                 voucherId = voucher.getId();
                 userid = voucher.getUserid();

                if ("VISA".equals(voucherRequest.getPaymentMethod())) { //simulate payment
                    BigDecimal discountedAmount = voucherRequest.getAmount().multiply(BigDecimal.valueOf(0.9));
                    checkoutResponse.setAmount(discountedAmount);
                    checkoutResponse.setMessage("VISA Payment discount applied (10%); Total Amount paid: $" + discountedAmount);
                    qr_string =qr.generateQR(voucherRequest.getBuyerPhone());
                    checkoutResponse.setImageUrl(qr_string);
                    int rowupdated = voucherRepository.updateQRcode(qr.generateQR(voucherRequest.getBuyerPhone()),voucherId);
                    logger.info("Row updated "+ rowupdated);
                    return ResponseEntity.ok(checkoutResponse);
                } else {
                    checkoutResponse.setMessage("Payment method not eligible for discount.Total Amount paid: $" + voucherRequest.getAmount());
                    return ResponseEntity.ok(checkoutResponse);
                }
            } else {
                checkoutResponse.setMessage("Error during checkout. Please try again. "+ response.getBody());
                return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(checkoutResponse);
            }
        }catch (Exception e){
            checkoutResponse.setMessage("Error during checkout. Please try again. "+ e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(checkoutResponse);
        }finally {

            if(voucherId != null){
                PaymentHistory paymentHistory= new PaymentHistory();

                paymentHistory.setVoucher_id(voucherId);
                paymentHistory.setUser_id(userid);
                paymentHistory.setQr_string(qr_string);

                historyRepository.save(paymentHistory);
            }
        }
    }



}
