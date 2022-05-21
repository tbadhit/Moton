//
//  DetailViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit
import EventKit

class DetailViewController: UIViewController {
  
  var date: Date?
  
  @IBOutlet weak var dateRecommendationTableView: UITableView!
  
  var dateRecomList : [DateRecommendation] = []
  let eventStore = EKEventStore()
  var selectedDateRecommendation: DateRecommendation?
  var movieTitle : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = date?.dayAndTimeText
    dateRecommendationTableView.dataSource = self
    dateRecommendationTableView.delegate = self
    
    dateRecommendationTableView.register(UINib(nibName: "DateRecommendationTableViewCell", bundle: nil), forCellReuseIdentifier: dateRecommendationTableViewCellId)
    
    initDateRecom()
    
  }
  
  func reloadData() {
    dateRecomList.removeAll()
    initDateRecom()
    self.dateRecommendationTableView.reloadData()
  }
  
  
  func initDateRecom() {
    var calendar = Calendar(identifier: .gregorian)
    var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    calendar.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)!
    let startOfDate = calendar.startOfDay(for: date!) // 2022-05-19 00:00:00 +7000
//    let endOfDate = Calendar.current.date(byAdding: .day, value: 1, to: startOfDate) // 2022-05-20 00:00:00 +0000
    
//    let dateHourArray = Date.dateHours(from: startOfDate, to: endOfDate!)
//    print(dateHourArray)
    
    //    for hour in dateHourArray {
    //      let startDate = hour
    //      let endDate = Calendar.current.date(byAdding: .hour, value: 2, to: hour)
    //      let diffComponents = Calendar.current.dateComponents([.hour], from: startDate, to: endDate!)
    //      let duration = diffComponents.hour
    //      dateRecomList.append(DateRecommendation(date: hour, startTime: startDate, endTime: endDate!, duration: duration!))
    //    }
    
    // EventKit
    let startDate = dateComponents(hour: 8, date: startOfDate)
    let endDate = dateComponents(hour: 22, date: startOfDate)
    
    let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
    let eventKitEvents = eventStore.events(matching: predicate)
    print(eventKitEvents)
    
    
    if eventKitEvents.isEmpty {
      let duration = getDuration(startDate: startDate, endDate: endDate)
      dateRecomList.append(DateRecommendation(date: date, startTime: startDate, endTime: endDate, duration: duration))
    } else {
      
      for (index,event) in eventKitEvents.enumerated() {
        let start = eventKitEvents.first?.startDate
        let hour = Calendar.current.component(.hour, from: start!)
        
        let firstEventEndDate = eventKitEvents.first?.endDate
        let hourEndFirstEvent = Calendar.current.component(.hour, from: firstEventEndDate!)
        
        let firstEventStartDate = eventKitEvents.first?.startDate
        let hourStartFirstEvent = Calendar.current.component(.hour, from: firstEventStartDate!)
        
        if event == eventKitEvents.first {
          if hour > 8 {
            print(hour)
            let startFreeTimeUnder = startDate
            let endFreeTimeUnder = eventKitEvents.first?.startDate
            
            let startFreeTimeAfter = eventKitEvents.first?.endDate
            let endFreeTimeAfter = endDate
            
            if eventKitEvents.count == 1 {
              let durationUnder = getDuration(startDate: startFreeTimeUnder, endDate: endFreeTimeUnder!)
              let durationAbove = getDuration(startDate: startFreeTimeAfter!, endDate: endFreeTimeAfter)
              if durationUnder >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTimeUnder, endTime: endFreeTimeUnder!, duration: durationUnder))
              }
              if durationAbove >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTimeAfter!, endTime: endFreeTimeAfter, duration: durationAbove))
              }
            } else {
              let duration = getDuration(startDate: startFreeTimeUnder, endDate: endFreeTimeUnder!)
              if duration >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTimeUnder, endTime: endFreeTimeUnder!, duration: duration))
              }
            }
          } else if hour == 8 {
            let startFreeTime = firstEventEndDate
            let endFreeTime: Date?
            
            if eventKitEvents.count == 1 {
              endFreeTime = endDate
            } else {
              endFreeTime = eventKitEvents[index + 1].startDate
            }
            
            let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime!)
            
            if duration >= 2 {
              dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime!, duration: duration))
            }
          } else if hourStartFirstEvent < 8 && hourEndFirstEvent >= 8 {
            let startFreeTime = event.endDate
            let endFreeTime: Date?
            if eventKitEvents.count == 1 {
              if hourEndFirstEvent >= 10 {
                return
              }else{
                endFreeTime = endDate
              }
            } else {
              endFreeTime = eventKitEvents[index + 1].startDate
            }
            let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime!)
            if duration >= 2 {
              dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime!, duration: duration))
            }
            
            
          }
        } else if event != eventKitEvents.first && event != eventKitEvents.last {
          if hour < 10 {
            
            if hourStartFirstEvent > 8 {
              let startFreeTime = eventKitEvents[index - 1].endDate
              let endFreeTime = event.startDate
              let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime!)
              if duration >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime!, duration: duration))
              }
            } else if hourStartFirstEvent == 8 {
              let startFreeTime = event.endDate
              let endFreeTime = eventKitEvents[index + 1].startDate
              
              let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime!)
              if duration >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime!, duration: duration))
              }
            }
            
            if hourStartFirstEvent < 8 && hourEndFirstEvent >= 8 {
              let startFreeTime = event.endDate
              let endFreeTime = eventKitEvents[index + 1].startDate
              let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime!)
              if duration >= 2 {
                dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime!, duration: duration))
              }
            }
          }
        } else if event == eventKitEvents.last {
          let startLastHour = eventKitEvents.last?.startDate
          let startHour = Calendar.current.component(.hour, from: startLastHour!)
          let end = eventKitEvents.last?.endDate
          let endHour = Calendar.current.component(.hour, from: end!)
         
          if startHour <= 22 {
            
            let startFreeTime: Date = (eventKitEvents.last?.endDate)!// eventKitEvents[index - 1].endDate
            let endFreeTime: Date = endDate
            
            let duration = getDuration(startDate: startFreeTime, endDate: endFreeTime)
            if duration >= 2 {
              dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime, endTime: endFreeTime, duration: duration))
            }
          } else if endHour < 22 {

            let startFreeTime = event.endDate
            let endFreeTime = endDate
            let duration = getDuration(startDate: startFreeTime!, endDate: endFreeTime)
            if duration >= 2 {
              dateRecomList.append(DateRecommendation(date: date, startTime: startFreeTime!, endTime: endFreeTime, duration: duration))
            }
          }
          
          
          
        }
      }
      
      print(dateRecomList)
      print(dateRecomList.count)
      
    }
  }
  
  
  func getDuration(startDate: Date, endDate: Date) -> Int {
    let diffComponents = Calendar.current.dateComponents([.hour], from: startDate, to: endDate)
    let hour = diffComponents.hour
    return hour!
  }
  
  func dateComponents (hour: Int, date: Date) -> Date {
    var oneComponents = DateComponents()
    oneComponents.hour = hour
    return Calendar.current.date(byAdding: oneComponents, to: date)!
  }
  
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0
  }
}

extension DetailViewController: UITableViewDataSource {
  // To return how many cell display
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dateRecomList.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: dateRecommendationTableViewCellId,for: indexPath) as! DateRecommendationTableViewCell
    let dateItem = dateRecomList[indexPath.row]
    
    cell.dateLabel.text = "\(dateItem.duration)"
    cell.timeLabel.text = "\(dateItem.startTime.time) - \(dateItem.endTime.time)"
    
    return cell
  }
}

extension DetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    selectedDateRecommendation = dateRecomList[indexPath.row]
    performSegue(withIdentifier: "showForm", sender: selectedDateRecommendation)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showForm" {
        let controller = segue.destination as! UINavigationController
        let controllerTableView = controller.topViewController as! FormAddEventViewController
        controllerTableView.dateRecommendation = selectedDateRecommendation
        controllerTableView.reloadData = {
//          DispatchQueue.main.async {
//            self.reloadData()
//          }
          self.reloadData()
        }
    }
  }
}

