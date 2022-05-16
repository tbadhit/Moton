//
//  WatchHistoryViewController.swift
//  Moton
//
//  Created by Fritzie Primananda Adi Praja on 16/05/22.
//

import UIKit

class WatchHistoryViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var historyListTable: UITableView!
  
  let historyList: [Schedule] = Schedule.sampleData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpTable()
    historyListTable.delegate = self
    historyListTable.dataSource = self
  }
  
  //Untuk SetUp Table dengan Cell-nya
  func setUpTable() {
    //Cell History List
    let nibScheduleList = UINib(nibName: "HistoryListTableViewCell", bundle: nil)
    
    //Set Table History List ke Cell-nya
    historyListTable.register(nibScheduleList, forCellReuseIdentifier: "historyListCell")
  }
  
  
  //MARK: Table View Function
  
  //Set ukuran height cell
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50.0
  }
  
  
}

extension WatchHistoryViewController: UITableViewDataSource {
  // To return how many cell display
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return historyList.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let history = historyList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "historyListCell",for: indexPath) as! HistoryListTableViewCell
    
    cell.titleLabel.text = history.title
    cell.dateLabel.text =  history.startDate.dayText //"Wed, april 20"
    cell.timeLabel.text = "09:00 PM - 11:00PM"
    
    return cell
  }
}

