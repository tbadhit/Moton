//
//  WatchHistoryViewController.swift
//  Moton
//
//  Created by Fritzie Primananda Adi Praja on 16/05/22.
//

import UIKit
import EventKit

class WatchHistoryViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var historyListTable: UITableView!
  
  let eventStore = EKEventStore()
  
  var historyList: [Schedule] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpTable()
    historyListTable.delegate = self
    historyListTable.dataSource = self
    initDateRecom()
  }
  
  func initDateRecom() {
    var calendar = Calendar(identifier: .gregorian)
    var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
    let today = calendar.startOfDay(for: Date())
    
    let startDate = setDate(date: today, addDay: -6)
    let endDate = setDate(date: today, addDay: 0)
    
    let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
    let eventKitEvents = eventStore.events(matching: predicate).filter({ event in
      event.title.hasPrefix("Moton")
    }).filter { event in
      event.startDate < Date.now
    }
    for event in eventKitEvents {
      historyList.append(Schedule(title: event.title, startDate: event.startDate, endDate: event.endDate, note: event.notes ?? "Note Empty"))
      print(type(of: event.alarms?[1].relativeOffset))
    }
    print(eventKitEvents)
  }
  
  func setDate(date: Date, addDay: Int) -> Date {
    let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
    
    return date!
  }
  
  func setUpTable() {
    let nibScheduleList = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
    
    historyListTable.register(nibScheduleList, forCellReuseIdentifier: scheduleTableViewCellId)
  }
  
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
}

extension WatchHistoryViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return historyList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let upComming = historyList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellId,for: indexPath) as! ScheduleTableViewCell
    
    cell.titleUpComming.text = upComming.title
    cell.noteUpComming.text =  upComming.note
    cell.dateDurationUpComming.text = "\(upComming.startDate.monthDayTimeText) - \(upComming.endDate.time)"
    
    return cell
  }
}

