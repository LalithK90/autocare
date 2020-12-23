package lk.sampath.autocare.asset.serviceTypeParameter.service;


import lk.sampath.autocare.asset.serviceTypeParameter.dao.ServiceTypeParameterDao;
import lk.sampath.autocare.asset.serviceTypeParameter.entity.ServiceTypeParameter;
import lk.sampath.autocare.util.interfaces.AbstractService;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceTypeParameterService implements AbstractService< ServiceTypeParameter, Integer> {
private final ServiceTypeParameterDao serviceTypeParameterDao;

    public ServiceTypeParameterService(ServiceTypeParameterDao serviceTypeParameterDao) {
        this.serviceTypeParameterDao = serviceTypeParameterDao;
    }

    public List<ServiceTypeParameter> findAll() {
        return serviceTypeParameterDao.findAll();
    }

    public ServiceTypeParameter findById(Integer id) {
        return serviceTypeParameterDao.getOne(id);
    }

    public ServiceTypeParameter persist(ServiceTypeParameter serviceTypeParameter) {
        return serviceTypeParameterDao.save(serviceTypeParameter);
    }

    public boolean delete(Integer id) {
        serviceTypeParameterDao.deleteById(id);
        return true;
    }

    public List<ServiceTypeParameter> search(ServiceTypeParameter serviceTypeParameter) {

        ExampleMatcher matcher = ExampleMatcher
                .matching()
                .withIgnoreCase()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);
        Example<ServiceTypeParameter> labTestParameterExample = Example.of(serviceTypeParameter, matcher);
        return serviceTypeParameterDao.findAll(labTestParameterExample);
    }
}