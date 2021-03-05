package lk.sampath_autocare.asset.process_controller;

import lk.sampath_autocare.asset.common_asset.model.TwoDate;
import lk.sampath_autocare.asset.payment.entity.Payment;
import lk.sampath_autocare.asset.payment.entity.enums.PaymentMethod;
import lk.sampath_autocare.asset.payment.entity.enums.PaymentStatus;
import lk.sampath_autocare.asset.payment.service.PaymentService;
import lk.sampath_autocare.asset.serviceType.entity.ServiceType;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.ServiceTypeParameterVehicle;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.entity.enums.ServiceTypeParameterVehicleStatus;
import lk.sampath_autocare.asset.service_type_parameter_vehicle.service.ServiceTypeParameterVehicleService;
import lk.sampath_autocare.asset.vehicle.entity.Vehicle;
import lk.sampath_autocare.asset.vehicle.service.VehicleService;
import lk.sampath_autocare.util.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Controller
@RequestMapping( "/vehicleServiceStationProcess" )
public class VehicleServiceStationProcessController {
  private final ServiceTypeParameterVehicleService serviceTypeParameterVehicleService;
  private final DateTimeAgeService dateTimeAgeService;
  private final VehicleService vehicleService;
  private final OperatorService operatorService;
  private final PaymentService paymentService;
  private final MakeAutoGenerateNumberService makeAutoGenerateNumberService;
  private final EmailService emailService;
  private final TwilioMessageService twilioMessageService;

  public VehicleServiceStationProcessController(ServiceTypeParameterVehicleService serviceTypeParameterVehicleService
      , DateTimeAgeService dateTimeAgeService, VehicleService vehicleService, PaymentService paymentService,
                                                OperatorService operatorService, PaymentService paymentService1,
                                                MakeAutoGenerateNumberService makeAutoGenerateNumberService,
                                                EmailService emailService,
                                                TwilioMessageService twilioMessageService) {
    this.serviceTypeParameterVehicleService = serviceTypeParameterVehicleService;
    this.dateTimeAgeService = dateTimeAgeService;
    this.vehicleService = vehicleService;
    this.operatorService = operatorService;
    this.paymentService = paymentService1;
    this.makeAutoGenerateNumberService = makeAutoGenerateNumberService;
    this.emailService = emailService;
    this.twilioMessageService = twilioMessageService;
  }

  @GetMapping
  public String allVehicleOnToday(Model model) {
    model.addAttribute("addStatus", true);
    return common(model, ServiceTypeParameterVehicleStatus.CHK, LocalDate.now(), LocalDate.now());
  }

  private String common(Model model, ServiceTypeParameterVehicleStatus serviceTypeParameterVehicleStatus,
                        LocalDate fromDate, LocalDate toDate) {

    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(fromDate);
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(toDate);
    Set< Vehicle > vehicles = new LinkedHashSet<>();

    serviceTypeParameterVehicleService.findByCreatedAtIsBetween(form, to).stream().filter(x -> x.getServiceTypeParameterVehicleStatus().equals(serviceTypeParameterVehicleStatus)).collect(Collectors.toList()).forEach(x -> vehicles.add(x.getVehicle()));
    model.addAttribute("vehicles", new ArrayList<>(vehicles));
    return "vehicleServiceStation/vehicleServiceStation";
  }

  @GetMapping( "/done" )
  public String getServiceTypeParameterVehicleStatusDone(Model model) {
    model.addAttribute("addStatus", false);
    model.addAttribute("addStatusPayment", true);
    return common(model, ServiceTypeParameterVehicleStatus.DONE, LocalDate.now(), LocalDate.now());
  }

  @PostMapping( "/done/search" )
  public String getServiceTypeParameterVehicleStatusDoneSearch(@ModelAttribute TwoDate twoDate, Model model) {
    model.addAttribute("addStatus", false);
    model.addAttribute("addStatusPayment", true);
    return common(model, ServiceTypeParameterVehicleStatus.DONE, twoDate.getStartDate(), twoDate.getEndDate());
  }

  @GetMapping( "/pending" )
  public String getServiceTypeParameterVehicleStatusPend(Model model) {
    model.addAttribute("addStatus", true);
    return common(model, ServiceTypeParameterVehicleStatus.PEND, LocalDate.now(), LocalDate.now());
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
    model.addAttribute("vehicle", vehicle);
    List< ServiceTypeParameterVehicleStatus > serviceTypeParameterVehicleStatuses = new ArrayList<>();
    serviceTypeParameterVehicleStatuses.add(ServiceTypeParameterVehicleStatus.CHK);
    serviceTypeParameterVehicleStatuses.add(ServiceTypeParameterVehicleStatus.DONE);
    model.addAttribute("serviceTypeParameterVehicleStatuses", serviceTypeParameterVehicleStatuses);
    model.addAttribute("addStatus", true);
    return "vehicleServiceStation/addVehicleServiceStation";
  }

  @PostMapping( "/save" )
  public String save(@ModelAttribute( "vehicle" ) Vehicle vehicle) {
    Vehicle vehicleDB = vehicleService.findById(vehicle.getId());
    vehicle.getServiceTypeParameterVehicles().forEach(serviceTypeParameterVehicleService::persist);

    LocalDate localDate = LocalDate.now();
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(localDate);
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(localDate);

    List< ServiceTypeParameterVehicle > serviceTypeParameterVehicles = serviceTypeParameterVehicleService
        .findByCreatedAtIsBetweenAndVehicle(form, to, vehicle);
    int allParameterSize = serviceTypeParameterVehicles.size();
    List< ServiceTypeParameterVehicle > jobDoneSize = serviceTypeParameterVehicles
        .stream()
        .filter(x -> x.getServiceTypeParameterVehicleStatus().equals(ServiceTypeParameterVehicleStatus.DONE))
        .collect(Collectors.toList());
    if ( allParameterSize != jobDoneSize.size() ) {
      serviceTypeParameterVehicles
          .stream()
          .filter(x -> x.getServiceTypeParameterVehicleStatus().equals(ServiceTypeParameterVehicleStatus.CHK))
          .collect(Collectors.toList())
          .forEach(x -> {
            x.setServiceTypeParameterVehicleStatus(ServiceTypeParameterVehicleStatus.PEND);
            serviceTypeParameterVehicleService.persist(x);
          });
    } else {
      HashSet< ServiceType > serviceTypes = new HashSet<>();
      jobDoneSize.forEach(x -> serviceTypes.add(x.getServiceType()));

      AtomicReference< BigDecimal > totalAmount = new AtomicReference<>(BigDecimal.ZERO);
      serviceTypes.forEach(x -> totalAmount.set(operatorService.addition(totalAmount.get(), x.getPrice())));

      Payment payment = new Payment();
      payment.setVehicle(vehicleDB);
      payment.setCustomer(vehicleDB.getCustomer());
      payment.setAmount(totalAmount.get());
      payment.setPaymentMethod(PaymentMethod.CASH);
      payment.setPaymentStatus(PaymentStatus.NOTPAID);

      Payment lastPayment = paymentService.lastPayment();
      if ( lastPayment == null ) {
        payment.setCode("SAP" + makeAutoGenerateNumberService.numberAutoGen(null).toString());
      } else {
        String previousCode = lastPayment.getCode().substring(3);
        payment.setCode("SAP" + makeAutoGenerateNumberService.numberAutoGen(previousCode).toString());
      }
      paymentService.persist(payment);
      //todo-> need to send email and message to customer
      String message = "Your Vehicle's Service is completed";
      //emailService.sendEmail();
      //twilioMessageService.sendSMS();
    }

    return "redirect:/vehicleServiceStationProcess";
  }

  @GetMapping( "/paid" )
  public String getServiceTypeParameterVehicleStatusPaid(Model model) {
    model.addAttribute("addStatus", false);
    model.addAttribute("addStatusPayment", true);
    return common(model, ServiceTypeParameterVehicleStatus.PAID, LocalDate.now(), LocalDate.now());
  }

  @PostMapping( "/paid/search" )
  public String getServiceTypeParameterVehicleStatusPaidSearch(@ModelAttribute TwoDate twoDate, Model model) {
    model.addAttribute("addStatus", false);
    model.addAttribute("addStatusPayment", true);
    return common(model, ServiceTypeParameterVehicleStatus.PAID, twoDate.getStartDate(), twoDate.getEndDate());
  }


}
