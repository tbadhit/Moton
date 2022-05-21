//
//  UpCommingViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit

class UpCommingViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var upCommingtableView: UITableView!
    let upCommingList: [Schedule] = Schedule.sampleData
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        
        upCommingtableView.delegate = self
        upCommingtableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setUpTable () {
      let nibDateRecommendation = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
        upCommingtableView.register(nibDateRecommendation, forCellReuseIdentifier: "upComming")
      
    }
    
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 90.0
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UpCommingViewController: UITableViewDataSource {
  // To return how many cell display
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return upCommingList.count
  }
  
  //Cell's Data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let upComming = upCommingList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "upComming",for: indexPath) as! UpCommingTableViewCell
    
      cell.titleLabel.text = upComming.title
      cell.noteLabel.text =  upComming.startDate.dayText
      cell.dayDateLabel.text = "09:00 PM - 11:00PM"
    
    return cell
  }
}

