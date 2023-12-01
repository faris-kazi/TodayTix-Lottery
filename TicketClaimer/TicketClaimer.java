public class TicketClaimer {
    private ApiService apiService;
    private PayPalService payPalService;

    //constructor that initializes paypal processing and backend service
    public TicketClaimer(ApiService apiService, PayPalService payPalService) {
        this.apiService = apiService;
        this.payPalService = payPalService;
    }

    // method for user to claim ticket within time frame
    public void claimTicket(String userId, String ticketId) {
        //implement timer logic to make sure user is within timefram, if not go to claim closer

        //if valid, process the payment
        PaymentDetails paymentDetails = payPalService.processPayment(userId, ticketId);
        apiService.postTicketClaim(userId, ticketId, paymentDetails);
    }
}

// defiune api service methods
public interface ApiService {
    void postTicketClaim(String userId, String ticketId, PaymentDetails paymentDetails);
}

//define paypal service methods 
public interface PayPalService {
    PaymentDetails processPayment(String userId, String ticketId);
}

// hold the details of the transaction
public class PaymentDetails {
    // Payment transaction details
}
