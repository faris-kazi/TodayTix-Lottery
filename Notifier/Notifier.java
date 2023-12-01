public class Notifier {
    private ApiService apiService;

    //initialize api service
    public Notifier(ApiService apiService) {
        this.apiService = apiService;
    }

    //sends an in-app notification to a user based on userId, this will be done via firebase cloud messaging
    public void sendNotification(String userId, String message) {
        apiService.sendNotification(userId, message);
    }

}

//interface that defines notification methods
public interface ApiService {
    void sendNotification(String userId, String message);
}
