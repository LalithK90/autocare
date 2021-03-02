package lk.sampath_autocare.asset.service_type_parameter_vehicle.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.serviceType.entity.ServiceType;
import lk.sampath_autocare.asset.service_type_parameter.entity.ServiceTypeParameter;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.enums.ServiceTypeParameterVehicleStatus;
import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import lk.sampath_autocare.util.audit.AuditEntity;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter( "ServiceTypeParameterVehicle" )
public class ServiceTypeParameterVehicle extends AuditEntity {

  @ManyToOne
  private ServiceTypeParameter serviceTypeParameter;

  @ManyToOne
  private Vehicle vehicle;

  @Enumerated( EnumType.STRING )
  private ServiceTypeParameterVehicleStatus serviceTypeParameterVehicleStatus;

  @Enumerated( EnumType.STRING)
  private LiveDead liveDead;

  @Transient
  private List< ServiceType > serviceTypes;

  @Transient
  private int meterValue;
}
