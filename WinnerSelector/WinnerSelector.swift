import Foundation

class WinnerSelector {
    private var apiService: ApiService
    private var googleRandomNumberService: GoogleRandomNumberService

    init(apiService: ApiService, googleRandomNumberService: GoogleRandomNumberService) {
        self.apiService = apiService
        self.googleRandomNumberService = googleRandomNumberService
    }

    // slect winners for a specific lottery
    func selectWinners(lotteryId: String) {
        //get the list of users that entered the lottery
        let entryList = apiService.getEntriesForLottery(lotteryId: lotteryId)

        //use googles randomnumberservice function to fairly select a random user as the winner
        let winnerIndex = googleRandomNumberService.getRandomIndex(upperBound: entryList.count)
        let winnerId = entryList[winnerIndex]

        //POST the winner to the backend
        apiService.updateWinner(lotteryId: lotteryId, winnerId: winnerId)
    }
}

protocol ApiService {
    func getEntriesForLottery(lotteryId: String) -> [String]
    func updateWinner(lotteryId: String, winnerId: String)
}

protocol GoogleRandomNumberService {
    func getRandomIndex(upperBound: Int) -> Int
}
