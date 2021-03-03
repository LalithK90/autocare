package lk.sampath_autocare.asset.process_controller;

import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.enums.ServiceTypeParameterVehicleStatus;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.service.ServiceTypeParameterVehicleService;
import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import lk.sampath_autocare.asset.vehicle.service.VehicleService;
import lk.sampath_autocare.util.service.DateTimeAgeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping( "/vehicleServiceStationProcess" )
public class VehicleServiceStationProcessController {
  private final ServiceTypeParameterVehicleService serviceTypeParameterVehicleService;
  private final DateTimeAgeService dateTimeAgeService;
  private final VehicleService vehicleService;

  public VehicleServiceStationProcessController(ServiceTypeParameterVehicleService serviceTypeParameterVehicleService
      , DateTimeAgeService dateTimeAgeService, VehicleService vehicleService) {
    this.serviceTypeParameterVehicleService = serviceTypeParameterVehicleService;
    this.dateTimeAgeService = dateTimeAgeService;
    this.vehicleService = vehicleService;
  }

  @GetMapping
  public String allVehicleOnToday(Model model) {
    model.addAttribute("addStatus", true);
    return common(model, ServiceTypeParameterVehicleStatus.CHK);
  }

  private String common(Model model, ServiceTypeParameterVehicleStatus serviceTypeParameterVehicleStatus) {
    LocalDate localDate = LocalDate.now();
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate);
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate);
    Set< Vehicle > vehicles = new LinkedHashSet<>();

    serviceTypeParameterVehicleService.findByCreatedAtIsBetween(form, to).stream().filter(x -> x.getServiceTypeParameterVehicleStatus().equals(serviceTypeParameterVehicleStatus)).collect(Collectors.toList()).forEach(x -> vehicles.add(x.getVehicle()));
    model.addAttribute("vehicles", new ArrayList<>(vehicles));
    return "vehicleServiceStation/vehicleServiceStation";
  }

  @GetMapping( "/done" )
  public String getServiceTypeParameterVehicleStatusDone(Model model) {
    model.addAttribute("addStatus", false);
    return common(model, ServiceTypeParameterVehicleStatus.DONE);
  }

  @GetMapping( "/pending" )
  public String getServiceTypeParameterVehicleStatusPend(Model model) {
    model.addAttribute("addStatus", true);
    return common(model, ServiceTypeParameterVehicleStatus.PEND);
  }

  @GetMapping( "/vehicle/{id}" )
  public String finishedServiceParameter(@PathVariable( "id" ) Integer id, Model model) {
    LocalDate localDate = LocalDate.now();
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate);
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate);
    Vehicle vehicle = vehicleService.findById(id);
    vehicle.setServiceTypeParameterVehicles(serviceTypeParameterVehicleService
                                                .findByCreatedAtIsBetweenAndVehicle(form, to, vehicle)
                                                .stream()
                                                .filter(x -> !x.getServiceTypeParameterVehicleStatus().equals(ServiceTypeParameterVehicleStatus.DONE))
                                                .collect(Collectors.toList()));
    model.addAttribute("vehicleDetail", vehicle);
    model.addAttribute("serviceTypeParameterVehicleStatuses", ServiceTypeParameterVehicleStatus.values());
    model.addAttribute("addStatus", true);
    return "vehicleServiceStation/addVehicleServiceStation";
  }

  @PostMapping( "/save" )
  public String save(@ModelAttribute( "vehicle" ) Vehicle vehicle) {

    return "redirect:/vehicleServiceStationProcess";
  }
}
