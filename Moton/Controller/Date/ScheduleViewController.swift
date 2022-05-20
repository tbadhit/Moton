//
//  ScheduleViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 20/05/22.
//

import UIKit

class ScheduleViewController: UIViewController {
  
  @IBOutlet weak var scheduleTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTable()
    scheduleTableView.dataSource = self
  }
  
  
  func setUpTable () {
    let nibScheduleList = UINib(nibName: "ScheduleListTableViewCell", bundle: nil)
    scheduleTableView.register(nibScheduleList, forCellReuseIdentifier: "scheduleListCell")
  }
  
}

extension ScheduleViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell", for: indexPath) as! ScheduleListTableViewCell
    
    cell.titleLabel.text = "Testing"
    
    return cell
    
  }
}
