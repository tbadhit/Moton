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
  var reloadData: (() -> Void)?
  
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
    
    startTimePicker.minimumDate = dateRecommendation!.startTime
    startTimePicker.maximumDate = dateRecommendation!.endTime
    endTimePicker.minimumDate = dateRecommendation!.startTime
    endTimePicker.maximumDate = dateRecommendation!.endTime
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
    self.dismiss(animated: true, completion: nil)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    reloadData?()
  }
}
