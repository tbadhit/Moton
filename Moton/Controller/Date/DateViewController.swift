//
//  ViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 14/05/22.
import UIKit

class DateViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var scheduleListTable: UITableView!
  
  var scheduleList: [Schedule] = Schedule.sampleData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTable()
    scheduleListTable.delegate = self
    scheduleListTable.dataSource = self
    
  }
  
  //Untuk SetUp Table dengan Cell-nya
  func setUpTable () {
    // Cell Schedule List
    let nibScheduleList = UINib(nibName: "ScheduleListTableViewCell", bundle: nil)
    
    // Cell Date Recommendation
    // let nibDateRecommendation = UINib(nibName: "DateRecommendationTableViewCell", bundle: nil)
    
    // Set Table Schedule List ke Cell-nya
    scheduleListTable.register(nibScheduleList, forCellReuseIdentifier: "scheduleListCell")
    
    // MARK: Lanjut ke Table / Collection Date Recommendation
  }
  
  // MARK: Table View Function
  
  //Set ukuran height cell
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0
  }
}


extension DateViewController: UITableViewDataSource {
  
  // To return how many cell display
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return scheduleList.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell",for: indexPath) as! ScheduleListTableViewCell
    let schedule = scheduleList[indexPath.row]
    
    cell.titleLabel.text = schedule.title
    cell.dateTimeLabel.text = schedule.startDate.dayAndTimeText // "Wed, 13 April 2022, 20:00 PM - 21:00 PM"
    cell.notesLabel.text = schedule.note
    
    return cell
  }
  
}

