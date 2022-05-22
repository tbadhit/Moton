//
//  ViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 14/05/22.
import UIKit

class DateViewController: UIViewController {
  
  @IBOutlet weak var dateRecomTableView: UITableView!
  
  var dateRecommendation: [Date] = []
  var selectedDate: Date?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTable()
    dateRecomTableView.delegate = self
    dateRecomTableView.dataSource = self
    initDateRecommendation()
  }
  
  func initDateRecommendation() {
    let today = Date()
    
    dateRecommendation = [
      getDateRecommendation(date: today, addDay: 0),
      getDateRecommendation(date: today, addDay: 1),
      getDateRecommendation(date: today, addDay: 2),
      getDateRecommendation(date: today, addDay: 3),
      getDateRecommendation(date: today, addDay: 4),
      getDateRecommendation(date: today, addDay: 5),
      getDateRecommendation(date: today, addDay: 6)
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
  
  func setUpTable () {
    let nibDateRecommendation = UINib(nibName: "DateTableViewCell", bundle: nil)
    
    dateRecomTableView.register(nibDateRecommendation, forCellReuseIdentifier: dateTableViewCellId)
    
  }
  
  //Set ukuran height cell
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0
  }
}


extension DateViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dateRecommendation.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: dateTableViewCellId,for: indexPath) as! DateTableViewCell
    let date = dateRecommendation[indexPath.row]
    
    cell.backgroundColor = UIColor.white
    cell.timeLabel.text = yearMonthDayString(date: date)
      cell.contentView.backgroundColor = UIColor.white
//      cell.timeLabel.textColor = UIColor.white
      cell.containerView.layer.cornerRadius = 10
      
    return cell
  }
}


extension DateViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
      selectedDate = dateRecommendation[indexPath.row]
      performSegue(withIdentifier: "showDetail", sender: selectedDate)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      let controller = segue.destination as! DetailViewController
      controller.date = selectedDate
    }
//      if let presentationController = segue.destination.popoverPresentationController { // 1
//          segue.destination.preferredContentSize = CGSize(width: 300, height: 200)
//          presentationController.delegate = self // 2
//      }
  }
}

//extension DateViewController : UIPopoverPresentationControllerDelegate {
//    func adaptivePresentationStyle(for controller: UIPresentationController,
//                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle {
//        return .none // 3
//    }
//}
