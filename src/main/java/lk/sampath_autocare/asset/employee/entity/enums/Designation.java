package lk.sampath_autocare.asset.employee.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Designation {
  ADMIN("Admin"),
    MANAGER("Manager"),
  IN_OFFICER("In_Officer"),
  TECH("Technitian"),
    CASHIER("Cashier");

    private final String designation;
}
