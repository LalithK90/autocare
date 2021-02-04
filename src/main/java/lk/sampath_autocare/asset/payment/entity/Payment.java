package lk.sampath_autocare.asset.payment.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.sampath_autocare.asset.customer.entity.Customer;
import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import lk.sampath_autocare.util.audit.AuditEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter("Payment")
public class Payment extends AuditEntity {

  @ManyToOne
  private Customer customer;

  @ManyToOne
  private Vehicle vehicle;



}
