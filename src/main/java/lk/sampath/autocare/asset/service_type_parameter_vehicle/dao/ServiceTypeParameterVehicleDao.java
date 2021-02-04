package lk.sampath.autocare.asset.service_type_parameter_vehicle.dao;

import lk.sampath.autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceTypeParameterVehicleDao extends JpaRepository< ServiceTypeParameterVehicle, Integer> {
}
