package lk.sampath.autocare.asset.service_type_parameter_vehicle.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.sampath.autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath.autocare.asset.service_type_parameter.entity.ServiceTypeParameter;
import lk.sampath.autocare.asset.service_type_parameter_vehicle.entity.enums.ServiceTypeParameterVehicleStatus;
import lk.sampath.autocare.asset.vehicle.entity.Vehicle;
import lk.sampath.autocare.util.audit.AuditEntity;
import lombok.*;

import javax.persistence.*;

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
}
