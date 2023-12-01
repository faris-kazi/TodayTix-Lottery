import java.util.List;

public class WinnerSelector {
    private ApiService apiService;
    private GoogleRandomNumberService googleRandomNumberService;

    public WinnerSelector(ApiService apiService, GoogleRandomNumberService googleRandomNumberService) {
        this.apiService = apiService;
        this.googleRandomNumberService = googleRandomNumberService;
    }

    //this method selects the winners of a specific lottery
    public void selectWinners(String lotteryId) {
        //uses api to get the list of users that entered the lottery
        List<String> entryList = apiService.getEntriesForLottery(lotteryId);

        //use googles randomnumberservice function to fairly select a random user as the winner
        int winnerIndex = googleRandomNumberService.getRandomIndex(entryList.size());
        String winnerId = entryList.get(winnerIndex);

        //POST the winner to the backend
        apiService.updateWinner(lotteryId, winnerId);
    }
}

public interface ApiService {
    List<String> getEntriesForLottery(String lotteryId);
    void updateWinner(String lotteryId, String winnerId);
}

public interface GoogleRandomNumberService {
    int getRandomIndex(int upperBound);
}
