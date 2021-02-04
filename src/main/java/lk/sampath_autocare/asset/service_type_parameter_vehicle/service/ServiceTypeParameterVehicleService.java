package lk.sampath_autocare.asset.service_type_parameter_vehicle.service;


import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.dao.ServiceTypeParameterVehicleDao;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath_autocare.util.interfaces.AbstractService;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceTypeParameterVehicleService implements AbstractService< ServiceTypeParameterVehicle, Integer> {
  private final ServiceTypeParameterVehicleDao serviceTypeParameterVehicleDao;

  public ServiceTypeParameterVehicleService(ServiceTypeParameterVehicleDao serviceTypeParameterVehicleDao) {
    this.serviceTypeParameterVehicleDao = serviceTypeParameterVehicleDao;
  }


  public List<ServiceTypeParameterVehicle> findAll() {
    return serviceTypeParameterVehicleDao.findAll();
  }

  public ServiceTypeParameterVehicle findById(Integer id) {
    return serviceTypeParameterVehicleDao.getOne(id);
  }

  public ServiceTypeParameterVehicle persist(ServiceTypeParameterVehicle serviceTypeParameterVehicle) {
    if ( serviceTypeParameterVehicle.getId() == null ) {
      serviceTypeParameterVehicle.setLiveDead(LiveDead.ACTIVE);
    }
    return serviceTypeParameterVehicleDao.save(serviceTypeParameterVehicle);
  }

  public boolean delete(Integer id) {
    ServiceTypeParameterVehicle serviceTypeParameterVehicle = serviceTypeParameterVehicleDao.getOne(id);
    serviceTypeParameterVehicle.setLiveDead(LiveDead.STOP);
    serviceTypeParameterVehicleDao.save(serviceTypeParameterVehicle);
    return true;
  }

  public List<ServiceTypeParameterVehicle> search(ServiceTypeParameterVehicle serviceTypeParameterVehicle) {

    ExampleMatcher matcher = ExampleMatcher
        .matching()
        .withIgnoreCase()
        .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);
    Example<ServiceTypeParameterVehicle> labTestParameterExample = Example.of(serviceTypeParameterVehicle, matcher);
    return serviceTypeParameterVehicleDao.findAll(labTestParameterExample);
  }
}
