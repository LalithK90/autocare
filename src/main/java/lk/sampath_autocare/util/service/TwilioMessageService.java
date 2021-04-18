package lk.sampath_autocare.util.service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.springframework.stereotype.Service;


@Service
public class TwilioMessageService{
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "AC66b711628fcd800a0d4693333e37c8f1";
    public static final String AUTH_TOKEN = "db9364a2b5a72a2ca763cfa89865f86a";


    public void sendSMS(String number, String messageBody){
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
            Message message = Message
                    .creator(new PhoneNumber(number), new PhoneNumber("+17474778656"),
                             messageBody)
                    .create();

            System.out.println("Message "+message.getSid());
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
