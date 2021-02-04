package lk.sampath_autocare.asset.serviceType.dao;



import lk.sampath_autocare.asset.serviceType.entity.ServiceType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceTypeDao extends JpaRepository< ServiceType, Integer> {

}
