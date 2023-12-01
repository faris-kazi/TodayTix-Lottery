//library to incorporate Apple Pay in iOS on swift
import PassKit

class PaymentProcessor {
    let apiService: ApiService
    let paymentController: PKPaymentAuthorizationController?

    init(apiService: ApiService) {
        self.apiService = apiService
        //configure apple pay to initialize paymentController
    }

    func processPayment(order: UserOrder) {
        //configure the apple pay request
        let request = PKPaymentRequest()
        // Set up request with order details

        paymentController = PKPaymentAuthorizationController(paymentRequest: request)
        paymentController?.delegate = self
        paymentController?.present(completion: { success in
            if success {
                //payment successful logic
            } else {
                //payment failure logic
            }
        })
    }
}

extension PaymentProcessor: PKPaymentAuthorizationControllerDelegate {
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        // payment completed
    }

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        //process payment
        apiService.issueTicket(payment: payment) { result in
            //handle result
        }
    }
