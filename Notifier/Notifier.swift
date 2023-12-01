class Notifier {
    let apiService: ApiService

    // Constructor to initialize the ApiService
    init(apiService: ApiService) {
        self.apiService = apiService
    }

    //sneds an in app notification to the user based on userId via firebase cloud messaging
    func sendNotification(to userId: String, with message: String) {
        apiService.sendNotification(to: userId, with: message)
    }
}

//protocol that defines notification methods
protocol ApiService {
    func sendNotification(to userId: String, with message: String)
}
