package lk.sampath_autocare.asset.payment.controller;

import lk.sampath_autocare.asset.common_asset.model.Enum.LiveDead;
import lk.sampath_autocare.asset.common_asset.model.TwoDate;
import lk.sampath_autocare.asset.customer.service.CustomerService;
import lk.sampath_autocare.asset.payment.entity.Payment;
import lk.sampath_autocare.asset.payment.entity.enums.PaymentStatus;
import lk.sampath_autocare.asset.payment.service.PaymentService;
import lk.sampath_autocare.asset.vehicle.service.VehicleService;
import lk.sampath_autocare.util.service.DateTimeAgeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.stream.Collectors;

@Controller
@RequestMapping( "/payment" )
public class PaymentController {
  private final PaymentService paymentService;
  private final CustomerService customerService;
  private final VehicleService vehicleService;
  private final DateTimeAgeService dateTimeAgeService;

  public PaymentController(PaymentService paymentService, CustomerService customerService,
                           VehicleService vehicleService, DateTimeAgeService dateTimeAgeService) {
    this.paymentService = paymentService;
    this.customerService = customerService;
    this.vehicleService = vehicleService;
    this.dateTimeAgeService = dateTimeAgeService;
  }

  @GetMapping
  public String allPayment(Model model) {
    model.addAttribute("action", "/payment/allCustom");
    model.addAttribute("payments",
                       paymentService.findAll()
                           .stream()
                           .filter(x -> x.getLiveDead().equals(LiveDead.ACTIVE))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @PostMapping( "/allCustom" )
  public String allPaymentCustom(@ModelAttribute TwoDate twoDate, Model model) {
    model.addAttribute("action", "/payment/allCustom");
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(twoDate.getStartDate());
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(twoDate.getEndDate());
    model.addAttribute("payments",
                       paymentService.findByCreatedAtIsBetween(form, to)
                           .stream()
                           .filter(x -> x.getLiveDead().equals(LiveDead.ACTIVE))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @GetMapping( "/notPaid" )
  public String allNotPayment(Model model) {
    model.addAttribute("action", "/payment/notPaidCustom");
    model.addAttribute("payments",
                       paymentService.findAll()
                           .stream()
                           .filter(x -> x.getPaymentStatus().equals(PaymentStatus.NOTPAID))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @PostMapping( "/notPaidCustom" )
  public String allNotPaymentCustom(@ModelAttribute TwoDate twoDate, Model model) {
    model.addAttribute("action", "/payment/notPaidCustom");
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(twoDate.getStartDate());
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(twoDate.getEndDate());
    model.addAttribute("payments",
                       paymentService.findByCreatedAtIsBetween(form, to)
                           .stream()
                           .filter(x -> x.getLiveDead().equals(LiveDead.ACTIVE) || x.getPaymentStatus().equals(PaymentStatus.NOTPAID))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @GetMapping( "/cancel" )
  public String cancelPayments(Model model) {
    model.addAttribute("action", "/payment/cancelCustom");
    model.addAttribute("payments",
                       paymentService.findAll()
                           .stream()
                           .filter(x -> x.getPaymentStatus().equals(PaymentStatus.CANCEL))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @PostMapping( "/cancelCustom" )
  public String cancelPaymentCustome(@ModelAttribute TwoDate twoDate, Model model) {
    model.addAttribute("action", "/payment/cancelCustom");
    LocalDateTime form = dateTimeAgeService.dateTimeToLocalDateStartInDay(twoDate.getStartDate());
    LocalDateTime to = dateTimeAgeService.dateTimeToLocalDateEndInDay(twoDate.getEndDate());
    model.addAttribute("payments",
                       paymentService.findByCreatedAtIsBetween(form, to)
                           .stream()
                           .filter(x -> x.getLiveDead().equals(LiveDead.ACTIVE) || x.getPaymentStatus().equals(PaymentStatus.CANCEL))
                           .collect(Collectors.toList()));
    return "payment/payment";
  }

  @GetMapping( "/cancel/{id}" )
  public String cancelPayment(@PathVariable( "id" ) Integer id) {
    Payment payment = paymentService.findById(id);
    payment.setPaymentStatus(PaymentStatus.CANCEL);
    paymentService.persist(payment);
    return "redirect:/payment";
  }

  @GetMapping( "/pay/{id}" )
  public String pay(@PathVariable( "id" ) Integer id, Model model) {
    Payment payment = paymentService.findById(id);
    model.addAttribute("payment", payment);
    model.addAttribute("customerDetail", customerService.findById(payment.getCustomer().getId()));
    model.addAttribute("vehicleDetail", vehicleService.findById(payment.getVehicle().getId()));
    return "payment/addPayment";
  }


}
