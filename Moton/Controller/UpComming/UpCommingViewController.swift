//
//  UpCommingViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit
import EventKit

class UpCommingViewController: UIViewController {
  
  @IBOutlet weak var upCommingtableView: UITableView!
  var upCommingList: [Schedule] = []
  var selectedMovieTitle: String?
  var selectedNotes : String?
  let eventStore = EKEventStore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTable()
    
    upCommingtableView.delegate = self
    upCommingtableView.dataSource = self
    initUpCome()
  }
  
  func initUpCome() {
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
    for event in eventKitEvents {
      upCommingList.append(Schedule(title: event.title, startDate: event.startDate, endDate: event.endDate, note: event.notes ?? "Note Empty"))
    }
    print(eventKitEvents)
  }
  
  func setDate(date: Date, addDay: Int) -> Date {
    let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
    
    return date!
  }
  
  func setUpTable () {
    let nibDateRecommendation = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
    upCommingtableView.register(nibDateRecommendation, forCellReuseIdentifier: scheduleTableViewCellId)
  }
  
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 112.0
  }
}

extension UpCommingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return upCommingList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let upComming = upCommingList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellId,for: indexPath) as! ScheduleTableViewCell
    
    cell.titleUpComming.text = upComming.title.components(separatedBy: "Moton - ")[1]
    cell.noteUpComming.text =  upComming.note
    cell.dateDurationUpComming.text = "\(upComming.startDate.monthDayTimeText) - \(upComming.endDate.time)"
      cell.containerView.layer.cornerRadius = 10
      
    return cell
  }
   
}

extension UpCommingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovieTitle = upCommingList[indexPath.row].title
        selectedNotes = upCommingList[indexPath.row].note
        performSegue(withIdentifier: "showTitleDetail", sender: selectedMovieTitle)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTitleDetail" {

        let controller = segue.destination as! ShowTitleViewController


        controller.movieTitle = selectedMovieTitle?.components(separatedBy: "Moton - ")[1]
        controller.notes = selectedNotes

                
            
        }
    }
}

