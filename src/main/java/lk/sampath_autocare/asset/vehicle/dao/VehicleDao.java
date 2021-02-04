package lk.sampath_autocare.asset.vehicle.dao;


import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VehicleDao extends JpaRepository< Vehicle, Integer> {
  Vehicle findByNumber(String number);
}
