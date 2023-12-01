# TodayTix-Lottery
This repository provides a detailed pseudo-code implementation for the user flow of the TodayTix Group (TTG) ticket lottery system. Each folder in this repository represents a distinct component of the feature, containing functionalities such as lottery entry (LotteryFinder), winner selection (WinnerSelector), and ticket claiming (TicketClaimer). The pseudo-code is available in both Java and Swift, illustrating how these processes can be implemented across different platforms (iOS and Android). The code is documented to highlight key programming concepts and integrations with external services like Firebase, PayPal, and Apple/Google Pay APIs. Here is a brief overview of each component:


**LotteryFinder**: This class would be responsible for filtering and finding available lotteries based on city and show criteria.
    - API: GET /lotteries/{city}
    - Objects/Classes: City, Show, Lottery
    - Web API: Google Places API for validating city locations if needed.


**LotteryEntry**: Manages the process of users entering a lottery for a specific performance.
    - API: POST /lottery/enter
    - Objects/Classes: User, Performance, LotteryEntry
    - Web API: Firebase Authentication for managing user sessions and entries.


**LotteryCloser**: A scheduled task or service that stops accepting entries after the lottery entry period has ended.
    - API: POST /lottery/{lotteryId}/close
    - Objects/Classes: Lottery, Scheduler
    - Web API: Firebase Cloud Function for scheduling tasks


**WinnerSelector**: Invokes the algorithm to randomly select winners.
    - API: POST /lottery/{lotteryId}/draw-winners
    - Objects/Classes: Lottery, EntryList, WinnerSelector
    - Web API: Google Cloud's random number generation services for fairness in lottery picks


**Notifier**: Handles in-app and email notifications to the winners.
    - APIs: POST /notifications/send-in-app
    - Objects/Classes: Notification, UserNotifier
    - Web API: Firebase Cloud Messaging for in-app notifications


**TicketClaimer**: Manages the process for winners to claim their tickets within the given time frame.
    - API: POST /tickets/claim
    - Objects/Classes: Ticket, ClaimTimer, User
    - Web API: PayPal API for handling the payment processing
    

**PaymentProcessor**: Processes payments and issues tickets upon successful transactions.
    - API: POST /tickets/issue
    - Objects/Classes: Payment, TicketIssuer, UserOrder
    - Web API: Apple Pay API and Google Pay API for processing payments

