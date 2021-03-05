package lk.sampath_autocare.asset.payment.controller;

import lk.sampath_autocare.asset.payment.service.PaymentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentController {
  private final PaymentService paymentService;
//todo -> need to verify payment
  public PaymentController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }
}
