package lk.sampath.autocare.asset.service_type_parameter.dao;


import lk.sampath.autocare.asset.service_type_parameter.entity.ServiceTypeParameter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceTypeParameterDao extends JpaRepository< ServiceTypeParameter, Integer> {

}
