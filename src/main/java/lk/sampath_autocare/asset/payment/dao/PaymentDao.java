package lk.sampath_autocare.asset.payment.dao;

import lk.sampath_autocare.asset.payment.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentDao extends JpaRepository< Payment, Integer > {
  Payment findFirstByOrderByIdDesc();
}
