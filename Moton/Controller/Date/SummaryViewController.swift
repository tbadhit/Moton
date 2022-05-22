//
//  ScheduleViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 20/05/22.
//

import UIKit
import EventKit

class SummaryViewController: UIViewController {
  
  @IBOutlet weak var titleSchedule: UILabel!
  @IBOutlet weak var notesSchedule: UILabel!
  @IBOutlet weak var dateDurationSchedule: UILabel!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var emptyTextLabel: UILabel!
  var upCommingSchedule: Schedule?
  
  let eventStore = EKEventStore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initUpComming()
    setUpViewData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    initUpComming()
    setUpViewData()
    
    if upCommingSchedule == nil {
      contentView.isHidden = true
      emptyTextLabel.isHidden = false
    } else {
      contentView.isHidden = false
      emptyTextLabel.isHidden = true
    }
  }
  
  func setUpViewData() {
    titleSchedule.text = upCommingSchedule?.title
    notesSchedule.text = upCommingSchedule?.note
    dateDurationSchedule.text = "\(upCommingSchedule?.startDate.monthDayTimeText ?? "") - \(upCommingSchedule?.endDate.time ?? "")"
    contentView.layer.cornerRadius = 10
  }
  
  func initUpComming() {
    var calendar = Calendar(identifier: .gregorian)
    var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
    let today = calendar.startOfDay(for: Date())
    
    let startDate = setDate(date: today, addDay: 0)
    let endDate = setDate(date: today, addDay: 6)
    
    let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
    let eventKitEvents = eventStore.events(matching: predicate).filter({ event in
      event.title.hasPrefix("Moton")
    })
    
    let event = eventKitEvents.first
    
    if event != nil {
      upCommingSchedule = Schedule(title: event?.title ?? "", startDate: event?.startDate ?? Date(), endDate: event?.endDate ?? Date(), note: event?.notes ?? "")
    }
  }
  
  func setDate(date: Date, addDay: Int) -> Date {
    let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
    
    return date!
  }
  
}


