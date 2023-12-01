public class ClaimCloser {
    // method to close a user's ticket claim by marking it as closed in the backend
    public void closeClaim(String ticketId) {
        // need an api client to interact with backend service
        ApiClient apiClient = new ApiClient();
        apiClient.postClose(ticketId);
    }

    //Firebase Cloud Function will have a trigger that calls the main mehtod
    public static void main(String[] args) {
        String ticketId = args[0]; //get the ticket id that needs to be closed 
        new TicketCloser().closeLottery(ticketId);
    }
}
