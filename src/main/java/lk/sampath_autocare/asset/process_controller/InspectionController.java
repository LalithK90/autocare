package lk.sampath_autocare.asset.process_controller;

import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.customer.service.CustomerService;
import lk.sampath_autocare.asset.serviceType.controller.ServiceTypeController;
import lk.sampath_autocare.asset.serviceType.entity.ServiceType;
import lk.sampath_autocare.asset.serviceType.service.ServiceTypeService;
import lk.sampath_autocare.asset.service_type_parameter.service.ServiceTypeParameterService;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.enums.ServiceTypeParameterVehicleStatus;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.service.ServiceTypeParameterVehicleService;
import lk.sampath_autocare.asset.user.entity.User;
import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import lk.sampath_autocare.asset.vehicle.service.VehicleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping( "/inspection" )
public class InspectionController {
  private final VehicleService vehicleService;
  private final CustomerService customerService;
  private final ServiceTypeService serviceTypeService;
  private final ServiceTypeParameterService serviceTypeParameterService;
  private final ServiceTypeParameterVehicleService serviceTypeParameterVehicleService;

  public InspectionController(VehicleService vehicleService, CustomerService customerService,
                              ServiceTypeService serviceTypeService,
                              ServiceTypeParameterService serviceTypeParameterService,
                              ServiceTypeParameterVehicleService serviceTypeParameterVehicleService) {
    this.vehicleService = vehicleService;
    this.customerService = customerService;
    this.serviceTypeService = serviceTypeService;
    this.serviceTypeParameterService = serviceTypeParameterService;
    this.serviceTypeParameterVehicleService = serviceTypeParameterVehicleService;
  }

  @GetMapping
  public String getInspectionForm(Model model) {
    model.addAttribute("vehicleSearch", true);
    model.addAttribute("vehicle", new Vehicle());
    return "inspection/inspectionForm";
  }

  @PostMapping( value = "/searchAll" )
  public String addUserEmployeeDetails(@ModelAttribute( "vehicle" ) Vehicle vehicle, Model model) {

    List< Vehicle > vehicles = vehicleService.search(vehicle);

    if ( vehicles.size() == 1 ) {
      Vehicle vehicleDB = vehicles.get(0);
      model.addAttribute("vehicleDetail", vehicleDB);
      model.addAttribute("customerDetail", vehicleDB.getCustomer());
      model.addAttribute("serviceTypeParameterVehicle", new ServiceTypeParameterVehicle());
      model.addAttribute("addStatus", true);
      model.addAttribute("vehicleSearch", false);
      model.addAttribute("serviceTypes", serviceTypeService.findAll()
          .stream()
          .filter(x -> x.getVehicleModel().equals(vehicleDB.getVehicleModel()) && x.getLiveDead().equals(LiveDead.ACTIVE))
          .collect(Collectors.toList()));
      model.addAttribute("serviceParameterUrl", MvcUriComponentsBuilder
          .fromMethodName(ServiceTypeController.class, "findId", "")
          .build()
          .toString());
      return "inspection/inspectionForm";
    }
    model.addAttribute("vehicleSearch", true);
    model.addAttribute("vehicle", new Vehicle());
    model.addAttribute("vehicles", vehicles);
    model.addAttribute("employeeDetailShow", false);
    model.addAttribute("employeeNotFoundShow", true);
    model.addAttribute("employeeNotFound", "There is not vehicle in the system according to the provided details" +
        " \n Could you please search again !!");

    return "inspection/inspectionForm";
  }

  @GetMapping( "/select/{id}" )
  public String vehicleDetail(@PathVariable( "id" ) Integer id, Model model) {
    Vehicle vehicle = vehicleService.findById(id);
    model.addAttribute("vehicleDetail", vehicle);
    model.addAttribute("customerDetail", vehicle.getCustomer());
    model.addAttribute("serviceTypeParameterVehicle", new ServiceTypeParameterVehicle());
    return "inspection/inspectionForm";
  }

  @PostMapping( "/save" )
  public String save(@Valid @ModelAttribute( "serviceTypeParameterVehicle" ) ServiceTypeParameterVehicle serviceTypeParameterVehicle, BindingResult bindingResult, Model model) {

    if(bindingResult.hasErrors()){
      return "redirect:/inspection";
    }
    for ( ServiceType serviceType : serviceTypeParameterVehicle.getServiceTypes() ) {
      serviceType.getServiceTypeParameters().forEach(x->{
        ServiceTypeParameterVehicle serviceTypeParameterVehicleDB = new ServiceTypeParameterVehicle();
        serviceTypeParameterVehicleDB.setServiceTypeParameter(x);
        serviceTypeParameterVehicleDB.setLiveDead(LiveDead.ACTIVE);
        serviceTypeParameterVehicleDB.setVehicle(serviceTypeParameterVehicle.getVehicle());
        serviceTypeParameterVehicleDB.setServiceTypeParameterVehicleStatus(ServiceTypeParameterVehicleStatus.CHK);
        serviceTypeParameterVehicleDB.setMeterValue(serviceTypeParameterVehicle.getMeterValue());
        serviceTypeParameterVehicleService.persist(serviceTypeParameterVehicleDB);
      });
    }

    return "redirect:/inspection";
  }
}
