package lk.sampath_autocare.asset.vehicle.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.customer.entity.Customer;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath_autocare.asset.vehicle.entity.Enum.VehicleModel;
import lk.sampath_autocare.util.audit.AuditEntity;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@JsonFilter("Vehicle")
public class Vehicle extends AuditEntity {

    @Column(unique = true)
    private String number; //NA09238

    @Column(unique = true, nullable = false)
    private String registrationNumber;// nn09089

    @Column(unique = true, nullable = false)
    private String engineNumber;

    @Column(unique = true, nullable = false)
    private String chassisNumber;

    private String manufacturedYear;

    private String gearNumber;

    @Enumerated(EnumType.STRING)
    private LiveDead liveDead;

    @Enumerated(EnumType.STRING)
    private VehicleModel vehicleModel;//van car or ...

    @ManyToOne(fetch = FetchType.EAGER)
    private Customer customer;

    @OneToMany(mappedBy = "vehicle")
    private List< ServiceTypeParameterVehicle > serviceTypeParameterVehicles;

}
