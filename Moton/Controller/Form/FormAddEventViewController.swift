//
//  FormAddEventViewController.swift
//  Moton
//
//  Created by erlina ng on 20/05/22.
//

import UIKit
import EventKit

class FormAddEventViewController: UITableViewController {
  
  var dateRecommendation: DateRecommendation?

  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var notesField: UITextField!
  @IBOutlet weak var startTimePicker: UIDatePicker!
  @IBOutlet weak var endTimePicker: UIDatePicker!
  
  let eventStore = EKEventStore()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    titleField.text = ""
    
    startTimePicker.date = dateRecommendation!.startTime
    endTimePicker.date = dateRecommendation!.endTime

        // Do any additional setup after loading the view.
    }
    
  @IBAction func addData(_ sender: Any) {
    eventStore.requestAccess(to: .event) { [self] success, error in
      if success && error == nil {
        let event: EKEvent = EKEvent(eventStore: self.eventStore)
        
        event.title = "Moton - \(self.titleField.text ?? "")"
        event.notes = self.notesField.text
        event.startDate = self.startTimePicker.date
        event.endDate = self.endTimePicker.date
        
        event.calendar = self.eventStore.defaultCalendarForNewEvents
        do {
          try self.eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
          print("Failed to save event with error : \(error)")
        }
        
        print("Saved event")
      }
    }
  }
  
//  eventStore.requestAccess(to: .event) { [self] (granted, error) in
//
//    if (granted) && (error == nil) {
////              print("granted \(granted)")
////              print("error \(error)")
////
//        let event:EKEvent = EKEvent(eventStore: eventStore)
//
//        event.title = title
//        event.startDate = startDate
//        event.endDate = endDate
////              event.notes = "This is a note"
//        event.calendar = eventStore.defaultCalendarForNewEvents
//        do {
//            try eventStore.save(event, span: .thisEvent)
//        } catch let error as NSError {
////                  print("failed to save event with error : \(error)")
//        }
////              print("Saved Event")
//    }
//    else{
//
////              print("failed to save event with error : \(error) or access not granted")
//    }
//  }
}
