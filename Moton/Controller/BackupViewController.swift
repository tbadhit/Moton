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
//override func eventsForDate(_ date: Date) -> [EventDescriptor] {
//    // The `date` always has it's Time components set to 00:00:00 of the day requested
//    let startDate = date
//    var oneDayComponents = DateComponents()
//    oneDayComponents.day = 1
//    // By adding one full `day` to the `startDate`, we're getting to the 00:00:00 of the *next* day
//    let endDate = calendar.date(byAdding: oneDayComponents, to: startDate)!
//
//    let predicate = eventStore.predicateForEvents(withStart: startDate, // Start of the current day
//                                                  end: endDate, // Start of the next day
//                                                  calendars: nil) // Search in all calendars
//
//    let eventKitEvents = eventStore.events(matching: predicate) // All events happening on a given day
//    print("Count:",eventKitEvents.count)
//
////        Note1: buat TB. append ini sifatnya sementara, ga nambah di calender. tapi emg bagus pake ini sebelum dia tekan tombol "Add to calender"
////        tolong.append(newEvent(startDate: Date().setTime(hour: 8, min: 12, sec: 59)!, endDate: Date().setTime(hour: 12, min: 2, sec: 3)!))
//
////        Note 2: buat TB. Nah yg ini setelah dia masuk ke page form tu dan pencet "add" baru dia push ke calender. Ternyata kemarin evennya jadi banyak karena setiap page ini di load (yang mana page ini adalah page utama di project ini) dia akan push event ke calender. Makanya selalu numpuk sampe banyak kalo di run. Jadi tunggu di add aja baru tambahEvent. Tapi untuk nampilin di app, sementara pake append aja, yang memang tampil, namun sementara (dalam artian blm di push ke calender user)
////        tambahEvent(startDate: Date().setTime(hour: 9, min: 15, sec: 0)!, endDate: Date().setTime(hour: 10, min: 0, sec: 0)!, title: "Meeting MC1")
//
//
////        print("Data event Kit : \(eventKitEvents.count)")
//
//    let calendarKitEvents = eventKitEvents.map(EKWrapper.init)
//
//    for i in 0...eventKitEvents.count {
//        if i == 0 {
////                print("i ke-> \(i) Data eventKit : \(eventKitEvents[i])")
//            let start = eventKitEvents[0].startDate!
//            let jam = (Calendar.current.component(.hour, from: start)) // startDate event = 7
//            if jam > 8 {
//                let awal: Date = Date().setTime(hour: 8, min: 0, sec: 0)!
//                let akhir: Date = eventKitEvents[0].startDate!
//                // if durasi > 2 :
//                    // tambahDate(awal, akhir)
//            }
//            else if jam < 8 { //diganti
//                let awal: Date = eventKitEvents[0].endDate!
//                let akhir: Date = eventKitEvents[1].startDate!
//                // if durasi > 2 :
//                    // tambahDate(awal, akhir)
//            }
//
////                tambahEvent()
//        } // [3] i =  1
//        // eventKitEvents = [] 1 hari doang, default get semua
//        else if i > 0 && i < eventKitEvents.count-1 { // dan dia buka index yang terakhir
////                print("i ke-> \(i) Data eventKit : \(eventKitEvents[i])")
//            let awal: Date = eventKitEvents[i-1].endDate!
//            let akhir: Date = eventKitEvents[i].startDate!
////                print(durasi(startDate: awal, endDate: akhir))
//
//        }
//        else if i == eventKitEvents.count-1 {
////                print("i ke-> \(i) Data eventKit : \(eventKitEvents[i])")
//
//        }
//
//    }
//
////        print("After: ",eventKitEvents.count)
//    return calendarKitEvents
//}

//fungsi bawaan priject Calendar.swift
//override func dayViewDidSelectEventView(_ eventView: EventView) {
//    guard let ckEvent = eventView.descriptor as? EKWrapper else {
//        return
//    }
//    presentDetailViewForEvent(ckEvent.ekEvent)
//}
//
//private func presentDetailViewForEvent(_ ekEvent: EKEvent) {
//    let eventController = EKEventViewController()
//    eventController.event = ekEvent
//    eventController.allowsCalendarPreview = true
//    eventController.allowsEditing = false
//    navigationController?.pushViewController(eventController,
//                                             animated: true)
//}
//
//// MARK: Event Editing
//
//override func dayView(dayView: DayView, didLongPressTimelineAt date: Date) {
//    // Cancel editing current event and start creating a new one
//    endEventEditing()
//    let newEKWrapper = createNewEvent(at: date)
//    create(event: newEKWrapper, animated: true)
//}
//
//private func createNewEvent(at date: Date) -> EKWrapper {
//    let newEKEvent = EKEvent(eventStore: eventStore)
//    newEKEvent.calendar = eventStore.defaultCalendarForNewEvents
//
//    var components = DateComponents()
//    components.hour = 1
//    let endDate = calendar.date(byAdding: components, to: date)
//
//    newEKEvent.startDate = date
//    newEKEvent.endDate = endDate
//    newEKEvent.title = "New event"
//
//    let newEKWrapper = EKWrapper(eventKitEvent: newEKEvent)
//    newEKWrapper.editedEvent = newEKWrapper
//    return newEKWrapper
//}

//fungsi tambahan yang kemarin dioprek-oprek
//func newEvent(startDate: Date, endDate: Date) -> EKEvent{
//    let newEKEvent = EKEvent(eventStore: eventStore)
//    newEKEvent.calendar = eventStore.defaultCalendarForNewEvents
//
//    newEKEvent.startDate = startDate
//    newEKEvent.endDate = endDate
//    newEKEvent.title = "DTambah"
//
//    let newEKWrapper = EKWrapper(eventKitEvent: newEKEvent)
//    newEKWrapper.editedEvent = newEKWrapper
//    print("halo",newEKWrapper)
////        print(type(of: newEKEvent))
//    return newEKEvent
//}
//
//func durasi(startDate: Date, endDate: Date) -> Int{
//    let diffComponents = Calendar.current.dateComponents([.hour], from: startDate, to: endDate)
//    let hours = diffComponents.hour
//    return hours!
//}
//
//func tambahEvent(startDate: Date, endDate: Date, title: String){
//    eventStore.requestAccess(to: .event) { [self] (granted, error) in
//
//      if (granted) && (error == nil) {
////              print("granted \(granted)")
////              print("error \(error)")
////
//          let event:EKEvent = EKEvent(eventStore: eventStore)
//
//          event.title = title
//          event.startDate = startDate
//          event.endDate = endDate
////              event.notes = "This is a note"
//          event.calendar = eventStore.defaultCalendarForNewEvents
//          do {
//              try eventStore.save(event, span: .thisEvent)
//          } catch let error as NSError {
////                  print("failed to save event with error : \(error)")
//          }
////              print("Saved Event")
//      }
//      else{
//
////              print("failed to save event with error : \(error) or access not granted")
//      }
//    }
//}

//Fungsi bawaan lainnya
//override func dayViewDidLongPressEventView(_ eventView: EventView) {
//    guard let descriptor = eventView.descriptor as? EKWrapper else {
//        return
//    }
//    endEventEditing()
//    beginEditing(event: descriptor,
//                 animated: true)
//}
//
//override func dayView(dayView: DayView, didUpdate event: EventDescriptor) {
//    guard let editingEvent = event as? EKWrapper else { return }
//    if let originalEvent = event.editedEvent {
//        editingEvent.commitEditing()
//
//        if originalEvent === editingEvent {
//            // If editing event is the same as the original one, it has just been created.
//            // Showing editing view controller
//            presentEditingViewForEvent(editingEvent.ekEvent)
//        } else {
//            // If editing event is different from the original,
//            // then it's pointing to the event already in the `eventStore`
//            // Let's save changes to oriignal event to the `eventStore`
//            try! eventStore.save(editingEvent.ekEvent,
//                                 span: .thisEvent)
//        }
//    }
//    reloadData()
//}
//
//
//private func presentEditingViewForEvent(_ ekEvent: EKEvent) {
//    let eventEditViewController = EKEventEditViewController()
//    eventEditViewController.event = ekEvent
//    eventEditViewController.eventStore = eventStore
//    eventEditViewController.editViewDelegate = self
//    present(eventEditViewController, animated: true, completion: nil)
//}
//
//override func dayView(dayView: DayView, didTapTimelineAt date: Date) {
//    endEventEditing()
//}
//
//override func dayViewDidBeginDragging(dayView: DayView) {
//    endEventEditing()
//}
//
//// MARK: - EKEventEditViewDelegate
//
//func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
//    endEventEditing()
//    reloadData()
//    controller.dismiss(animated: true, completion: nil)
//}
//}

//extension tambahan
//Note 3: untuk TB. Yang ini B belum fixed timezone
//extension Date {
//    public func setTime(hour: Int, min: Int, sec: Int, timeZoneAbbrev: String = "GMT") -> Date? {
//        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
//        let cal = Calendar.current
//        var components = cal.dateComponents(x, from: self)
//
//        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
//        components.hour = hour
//        components.minute = min
//        components.second = sec
//
//        return cal.date(from: components)
//    }
//}
