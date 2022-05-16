//
//  JournalViewController.swift
//  Moton
//
//  Created by Fritzie Primananda Adi Praja on 16/05/22.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var journalListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTable()
        journalListTable.delegate = self
        journalListTable.dataSource = self
    }
    
    //Untuk SetUp Table dengan Cell-nya
    func setUpTable() {
        
        //Cell Journal List
        let nibScheduleList = UINib(nibName: "JournalListTableViewCell", bundle: nil)
        
        //Set Table Journal List ke Cell-nya
        journalListTable.register(nibScheduleList, forCellReuseIdentifier: "journalListCell")

    }
    
    //MARK: Table View Function
    
    // To return how many cell display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Cell's Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalListCell",for: indexPath) as! JournalListTableViewCell
        
        cell.titleLabel.text = "Avengers : Infinity War"
        cell.dateLabel.text = "Wed, 20 april 2022"
        cell.timeLabel.text = "09:00 PM - 11:00PM"
        
        return cell
    }

    //Set ukuran height cell
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

}
