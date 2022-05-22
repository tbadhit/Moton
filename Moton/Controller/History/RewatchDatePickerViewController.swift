//
//  RewatchDatePickerViewController.swift
//  Moton
//
//  Created by erlina ng on 21/05/22.
//

import UIKit

class RewatchDatePickerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateTableView: UITableView!
    
    var dateRecommendation: [Date] = []
    
    var selectedDate: Date?
    
    var movieTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        dateTableView.delegate = self
        dateTableView.dataSource = self
        initDateRecommendation()
        
        titleLabel.text = movieTitle ?? ""
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

    func yearMonthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date) // MM-dd-yyyy
    }
    
    
    func setUpTable () {
        let nibDateRecommendation = UINib(nibName: "DateTableViewCell", bundle: nil)
        dateTableView.register(nibDateRecommendation, forCellReuseIdentifier: dateTableViewCellId)
      
    }

    //Set ukuran height cell
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}

extension RewatchDatePickerViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateRecommendation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dateTableViewCellId,for: indexPath) as! DateTableViewCell
        let date = dateRecommendation[indexPath.row]

        cell.timeLabel.text = yearMonthDayString(date: date)
        cell.containerView.layer.cornerRadius = 10
        return cell
    }
}

extension RewatchDatePickerViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectedDate = dateRecommendation[indexPath.row]
        performSegue(withIdentifier: "backShowDetail", sender: selectedDate)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backShowDetail" {
            let controller = segue.destination as! DetailViewController
            controller.date = selectedDate
            controller.movieTitle = movieTitle
        }
    }
}
