package com.kelvin.cms_app.repository;

import com.kelvin.cms_app.entity.UserAccount;
import com.kelvin.cms_app.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserAccount,Long> {

    Optional<UserAccount> findByPhonenumber(String phonenumber);
}
