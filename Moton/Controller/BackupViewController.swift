//import UIKit
//import CalendarKit
//import EventKit
//import EventKitUI
//
//final class CalendarViewController: DayViewController, EKEventEditViewDelegate {
//    private var eventStore = EKEventStore()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Calendar"
//        // The app must have access to the user's calendar to show the events on the timeline
//        requestAccessToCalendar()
//        // Subscribe to notifications to reload the UI when
//        subscribeToNotifications()
//    }
//
//    private func requestAccessToCalendar() {
//        // Request access to the events
//        eventStore.requestAccess(to: .event) { [weak self] granted, error in
//            // Handle the response to the request.
//            DispatchQueue.main.async {
//                guard let self = self else { return }
//                self.initializeStore()
//                self.subscribeToNotifications()
//                self.reloadData()
//            }
//        }
//    }
//
//    private func subscribeToNotifications() {
////        NotificationCenter.default.addObserver(self,
////                                               selector: #selector(storeChanged(_:)),
////                                               name: .EKEventStoreChanged,
////                                               object: eventStore)
//    }
//
//    private func initializeStore() {
//        eventStore = EKEventStore()
//    }
//
//    @objc private func storaeChanged(_ notification: Notification) {
//        reloadData()
//    }
//
    // TB LIAT DARI SINI KE BAWAH YA

//}
