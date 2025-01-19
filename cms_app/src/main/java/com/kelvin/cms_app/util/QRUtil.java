package com.kelvin.cms_app.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.ByteArrayOutputStream;
import java.security.SecureRandom;
import java.util.Base64;

public class QRUtil {


    public String generateQR(String phonenumber) {

        String resMessage;
        byte[] qrCodeImage = null;

        try {
            String lastSixDigits = phonenumber.length() >= 6 ? phonenumber.substring(phonenumber.length() - 6) : phonenumber;
            String randomLetters = generateRandomAlphabets(5);
            String promoCode = lastSixDigits + randomLetters;

            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(promoCode, BarcodeFormat.QR_CODE, 300, 300);

            ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);

            qrCodeImage = pngOutputStream.toByteArray();
            return Base64.getEncoder().encodeToString(qrCodeImage);
        } catch (Exception e) {
            resMessage = "Error generating QR Code: " + e.getMessage();
            return resMessage;
        }
    }

    private String generateRandomAlphabets(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        SecureRandom random = new SecureRandom();
        StringBuilder randomString = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            randomString.append(characters.charAt(randomIndex));
        }
        return randomString.toString();
    }
}
