package lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ServiceTypeParameterVehicleStatus {
  CHK("Checked"),
  DONE("Done"),
  PEND("Pending");

  private final String serviceTypeParameterVehicleStatus;
}
