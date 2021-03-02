package lk.sampath_autocare.asset.service_type_parameter.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ServiceSection {
  WASHING("Washing"),
  ENGINE("Engine");
  private final String serviceSection;
}
