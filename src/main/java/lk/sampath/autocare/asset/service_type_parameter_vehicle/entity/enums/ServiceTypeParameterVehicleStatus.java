package lk.sampath.autocare.asset.service_type_parameter_vehicle.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ServiceTypeParameterVehicleStatus {
CHK("Checked"),
  PEND("Pending"),
  DONE("Done");

private final String serviceTypeParameterVehicleStatus;
}
