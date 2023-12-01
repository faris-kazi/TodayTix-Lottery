//library that allows for server-side swift integration
import Vapor

final class LotteryCloser {
    //method to close a ticket 
    func closeLottery(lotteryId: String) {
        //api client that will interact with the backend
        let apiClient = ApiClient()
        apiClient.postLotteryClose(lotteryId: lotteryId)
    }

    //this will be called after firebase cloud function triggers it
    func main(args: [String]) {
        let TicketId = args[0] //ticket id for ticket that needs to be closed
        let TicketCloser = TicketCloser()
        TickdetCloser.closeTicket(ticketId: ticketId)
    }
}
