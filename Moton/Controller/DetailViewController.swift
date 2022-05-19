//
//  DetailViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 18/05/22.
//

import UIKit

class DetailViewController: UIViewController {
  
  
  @IBOutlet weak var dateRecommendationTableView: UITableView!
  var dateList : [DateRecommendation] = DateRecommendation.sampleData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    dateRecommendationTableView.dataSource = self
    
    //    dateRecommendationTableView.delegate = self
    
    dateRecommendationTableView.register(UINib(nibName: "DateRecommendationTableViewCell", bundle: nil), forCellReuseIdentifier: "DateRecommendationCell")
    
  }
  
  func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0
  }
}

extension DetailViewController: UITableViewDataSource {
  // To return how many cell display
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dateList.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DateRecommendationCell",for: indexPath) as! DateRecommendationTableViewCell
    let date = dateList[indexPath.row]
    
    cell.dateLabel.text = date.startDate
    cell.timeLabel.text = "\(date.startDate) - \(date.endDate)"
    
    return cell
  }
}
