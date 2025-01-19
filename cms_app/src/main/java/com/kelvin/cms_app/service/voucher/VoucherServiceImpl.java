package com.kelvin.cms_app.service.voucher;

import com.kelvin.cms_app.entity.UserAccount;
import com.kelvin.cms_app.entity.Voucher;
import com.kelvin.cms_app.model.ApiResponse;
import com.kelvin.cms_app.model.VoucherRequest;
import com.kelvin.cms_app.repository.UserRepository;
import com.kelvin.cms_app.repository.VoucherRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class VoucherServiceImpl implements VoucherService {

    @Autowired
    VoucherRepository voucherRepository;

    @Autowired
    UserRepository userRepository;

    private static final Logger logger = LoggerFactory.getLogger(VoucherServiceImpl.class);

    @Override
    public ResponseEntity<?> createVoucher(VoucherRequest voucherRequest) {
        ApiResponse apiResponse = new ApiResponse();
        Voucher voucher = new Voucher();
        UserAccount user = new UserAccount();

        Optional<UserAccount> existingUser  = userRepository.findByPhonenumber(voucherRequest.getBuyerPhone());
        if (existingUser.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("User with this phone number already exists!");
        }

        try{
            if(voucherRequest.getBuyType().equals("MYSELF_ONLY")){
                user.setBuyType(UserAccount.BuyType.MYSELF_ONLY);
                user.setName(voucherRequest.getBuyerName());
                user.setPhonenumber(voucherRequest.getBuyerPhone());
                user.setPurchaseLimit(5);
            } else if (voucherRequest.getBuyType().equals("GIFT_TO_OTHERS")){
                user.setBuyType(UserAccount.BuyType.GIFT_TO_OTHERS);
                user.setName(voucherRequest.getBuyerName());
                user.setPhonenumber(voucherRequest.getBuyerPhone());
                user.setPurchaseLimit(5);
                user.setGiftLimit(3);
            }
            logger.info("Saving user with buyType: " + user.getBuyType() + ", name: " + user.getName());
            user = userRepository.save(user);



            voucher.setTitle(voucherRequest.getTitle());
            voucher.setDescription(voucherRequest.getDescription());
            voucher.setImageUrl(voucherRequest.getImageUrl());
            voucher.setAmount(voucherRequest.getAmount());
            voucher.setPaymentMethod(voucherRequest.getPaymentMethod());
            voucher.setQuantity(voucherRequest.getQuantity());
            voucher.setUserid(user.getUserId());
            voucher.setStatus("A");

            voucher = voucherRepository.save(voucher);


            if (voucher.getId() != null) {
                apiResponse.setMessage("Voucher created successfully.");
                apiResponse.setStatus("SUCCESS");
                apiResponse.setData(voucher);
                return ResponseEntity.ok(apiResponse);
            } else {
                apiResponse.setMessage("Failed to create voucher.");
                apiResponse.setStatus("ERROR");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiResponse);
            }

        }catch (Exception e){
            logger.info("Error : " + e);
            apiResponse.setMessage("Failed to create voucher.");
            apiResponse.setStatus("ERROR");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiResponse);

        }

    }

    @Override
    public ResponseEntity<?> editVoucher(Long voucherID, VoucherRequest voucherRequest) {
        // Find the voucher by ID
        Voucher existingVoucher = voucherRepository.findById(voucherID).orElse(null);
        ApiResponse apiResponse = new ApiResponse();

        if (!existingVoucher.getDescription().isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Voucher not found with ID: " + voucherID);
        }

        try{
            // Update the fields of the existing voucher with the new data
            existingVoucher.setTitle(voucherRequest.getTitle());
            existingVoucher.setDescription(voucherRequest.getDescription());
            existingVoucher.setImageUrl(voucherRequest.getImageUrl());
            existingVoucher.setAmount(voucherRequest.getAmount());
            existingVoucher.setPaymentMethod(voucherRequest.getPaymentMethod());
            existingVoucher.setQuantity(voucherRequest.getQuantity());

            // Save the updated voucher
            voucherRepository.save(existingVoucher);
            apiResponse.setMessage("Voucher Edited successfully.");
            apiResponse.setStatus("SUCCESS");
            apiResponse.setData(existingVoucher);
            return ResponseEntity.ok(apiResponse);
        }catch (Exception e){
            logger.info("Error : " + e);
            apiResponse.setMessage("Failed to edit voucher.");
            apiResponse.setStatus("ERROR");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiResponse);

        }

    }

    @Override
    public ResponseEntity<?> toggleVoucher(Long voucherID) {
        // Find the voucher by ID
        Voucher existingVoucher = voucherRepository.findById(voucherID).orElse(null);
        ApiResponse apiResponse = new ApiResponse();


        try{
            // Update the fields of the existing voucher with the new status
            if(existingVoucher.getStatus().equals("A")){
                existingVoucher.setStatus("I");
            }else if(existingVoucher.getStatus().equals("I")){
                existingVoucher.setStatus("A");
            }

            // Save the updated voucher
            voucherRepository.save(existingVoucher);
            apiResponse.setMessage("Voucher Toggled successfully.");
            apiResponse.setStatus("SUCCESS");
            apiResponse.setData(existingVoucher);
            return ResponseEntity.ok(apiResponse);
        }catch (Exception e){
            logger.info("Error : " + e);
            apiResponse.setMessage("Failed to toggle voucher.");
            apiResponse.setStatus("ERROR");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiResponse);

        }
    }
}
