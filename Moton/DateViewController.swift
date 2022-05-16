//
//  ViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 14/05/22.
//
// maaf gaes aku gk mau ikut ngoding

// bye
// iya designer
import UIKit

class DateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scheduleListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        scheduleListTable.delegate = self
        scheduleListTable.dataSource = self
        
    }
    
    //Untuk SetUp Table dengan Cell-nya
    func setUpTable () {
        //Cell Schedule List
        let nibScheduleList = UINib(nibName: "ScheduleListTableViewCell", bundle: nil)
        
        //Cell Date Recommendation
        let nibDateRecommendation = UINib(nibName: "DateRecommendationTableViewCell", bundle: nil)
        
        //Set Table Schedule List ke Cell-nya
        scheduleListTable.register(nibScheduleList, forCellReuseIdentifier: "scheduleListCell")
        
        //Lanjut ke Table / Collection Date Recommendation
    }
    
    //MARK: Table View Function
    
    // To return how many cell display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Cell's Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell",for: indexPath) as! ScheduleListTableViewCell
        
        cell.titleLabel.text = "Avengers : Infinity War"
        cell.dateTimeLabel.text = "Wed, 13 April 2022, 20:00 PM - 21:00 PM"
        cell.notesLabel.text = "With Dedek Fritzie"
        
        return cell
    }

    //Set ukuran height cell
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}

