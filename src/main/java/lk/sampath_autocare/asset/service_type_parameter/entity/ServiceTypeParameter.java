package lk.sampath_autocare.asset.service_type_parameter.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.serviceType.entity.ServiceType;
import lk.sampath_autocare.asset.service_type_parameter.entity.enums.ServiceSection;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath_autocare.asset.vehicle.entity.enums.VehicleModel;
import lk.sampath_autocare.util.audit.AuditEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter("ServiceTypeParameter")
public class ServiceTypeParameter extends AuditEntity {

    private String name;

    private BigDecimal price;

    @Enumerated(EnumType.STRING)
    private ServiceSection serviceSection;

    @Enumerated(EnumType.STRING)
    private VehicleModel vehicleModel;

    @Enumerated( EnumType.STRING)
    private LiveDead liveDead;

    @OneToMany(mappedBy = "serviceTypeParameter")
    private List< ServiceTypeParameterVehicle > serviceTypeParameterVehicles;

    @ManyToMany(mappedBy = "serviceTypeParameters")
    private List< ServiceType > serviceTypes;



}
