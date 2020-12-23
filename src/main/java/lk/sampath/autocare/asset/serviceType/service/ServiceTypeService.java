package lk.sampath.autocare.asset.serviceType.service;




import lk.sampath.autocare.asset.commonAsset.model.Enum.LiveDead;
import lk.sampath.autocare.asset.customer.entity.Customer;
import lk.sampath.autocare.asset.serviceType.dao.ServiceTypeDao;
import lk.sampath.autocare.asset.serviceType.entity.ServiceType;
import lk.sampath.autocare.util.interfaces.AbstractService;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceTypeService implements AbstractService< ServiceType, Integer> {
    private final ServiceTypeDao serviceTypeDao;

    public ServiceTypeService(ServiceTypeDao serviceTypeDao) {
        this.serviceTypeDao = serviceTypeDao;
    }

    public List<ServiceType> findAll() {
        return serviceTypeDao.findAll();
    }

    public ServiceType findById(Integer id) {
        return serviceTypeDao.getOne(id);
    }

    public ServiceType persist(ServiceType serviceType) {
        if ( serviceType.getId() == null ) {
            serviceType.setLiveDead(LiveDead.ACTIVE);
        }
        return serviceTypeDao.save(serviceType);
    }

    public boolean delete(Integer id) {
        ServiceType serviceType = serviceTypeDao.getOne(id);
        serviceType.setLiveDead(LiveDead.STOP);
        serviceTypeDao.save(serviceType);
        return false;
    }

    public List<ServiceType> search(ServiceType serviceType) {
        ExampleMatcher matcher = ExampleMatcher
                .matching()
                .withIgnoreCase()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);
        Example<ServiceType> labTestExample = Example.of(serviceType, matcher);
        return serviceTypeDao.findAll(labTestExample);
    }
}
