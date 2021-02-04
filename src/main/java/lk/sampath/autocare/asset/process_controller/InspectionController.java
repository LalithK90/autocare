package lk.sampath.autocare.asset.process_controller;

import lk.sampath.autocare.asset.customer.service.CustomerService;
import lk.sampath.autocare.asset.employee.controller.EmployeeController;
import lk.sampath.autocare.asset.employee.entity.Employee;
import lk.sampath.autocare.asset.serviceType.service.ServiceTypeService;
import lk.sampath.autocare.asset.service_type_parameter.service.ServiceTypeParameterService;
import lk.sampath.autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath.autocare.asset.service_type_parameter_vehicle.service.ServiceTypeParameterVehicleService;
import lk.sampath.autocare.asset.user.entity.User;
import lk.sampath.autocare.asset.vehicle.controller.VehicleController;
import lk.sampath.autocare.asset.vehicle.entity.Vehicle;
import lk.sampath.autocare.asset.vehicle.service.VehicleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

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
      model.addAttribute("user", new User());
      model.addAttribute("vehicleDetail", vehicleDB);
      model.addAttribute("customerDetail", vehicleDB.getCustomer());
      model.addAttribute("serviceTypeParameterVehicle", new ServiceTypeParameterVehicle());
      model.addAttribute("addStatus", true);
      model.addAttribute("vehicleSearch", false);
      model.addAttribute("serviceTypes", serviceTypeService.findAll()
          .stream()
          .filter(x -> x.getVehicleModel().equals(vehicleDB.getVehicleModel()))
          .collect(Collectors.toList()));
      model.addAttribute("serviceTypeParameters", serviceTypeParameterService.findAll()
          .stream()
          .filter(x -> x.getVehicleModel().equals(vehicleDB.getVehicleModel()))
          .collect(Collectors.toList()));
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
}
