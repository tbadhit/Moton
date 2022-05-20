//
//  ViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 14/05/22.
import UIKit

class DateViewController: UIViewController {
  
  @IBOutlet weak var scheduleListTable: UITableView!
  
  var scheduleList: [Schedule] = Schedule.sampleData
  
  var dateRecommendation: [Date] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTable()
    scheduleListTable.delegate = self
    scheduleListTable.dataSource = self
    initDateRecommendation()
  }
  
  func initDateRecommendation() {
    let today = Date()
    
    dateRecommendation = [
      getDateRecommendation(date: today, addDay: 0),
      getDateRecommendation(date: today, addDay: 1),
      getDateRecommendation(date: today, addDay: 2)
    ]
  }
  
  func getDateRecommendation(date: Date, addDay: Int) -> Date {
    let date = Calendar.current.date(byAdding: .day, value: addDay, to: Date())
    
    return date!
  }
  
  func yearMonthDayString(date: Date) -> String
  {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
    return dateFormatter.string(from: date) // MM-dd-yyyy
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
    return dateRecommendation.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell",for: indexPath) as! ScheduleListTableViewCell
    let date = dateRecommendation[indexPath.row]
    
    cell.titleLabel.text = yearMonthDayString(date: date)
    
    return cell
  }
  
}


extension DateViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
    
    detail.date = dateRecommendation[indexPath.row]
        
    detail.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(detail, animated: true)
  }
}

