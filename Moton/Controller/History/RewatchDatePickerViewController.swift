//
//  RewatchDatePickerViewController.swift
//  Moton
//
//  Created by erlina ng on 21/05/22.
//

import UIKit
import RxSwift

class RewatchDatePickerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateTableView: UITableView!
    
    var selectedDate: Date?
    
    var movieTitle : String?
    
    let bag = DisposeBag()
    let viewModel = RewatchDatePickerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
        setupCellTapHandling()
        
        titleLabel.text = movieTitle ?? ""
      }
    
    
    func bindTableView () {
        let nibDateRecommendation = UINib(nibName: "DateTableViewCell", bundle: nil)
        dateTableView.register(nibDateRecommendation, forCellReuseIdentifier: dateTableViewCellId)
        
            viewModel.listDateRecommendation.bind(to: dateTableView.rx.items(cellIdentifier: dateTableViewCellId, cellType: DateTableViewCell.self)) {
                (row, item, cell) in
                cell.setCellWithValueOf(item)
            }.disposed(by: bag)
        
        viewModel.fetchDateRecommendation()
    }
    
    func setupCellTapHandling() {
        dateTableView.rx.modelSelected(Date.self).subscribe(onNext: {item in
            self.selectedDate = item
            self.performSegue(withIdentifier: "backShowDetail", sender: self.selectedDate)
        }).disposed(by: bag)
    }
    
    func yearMonthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date) // MM-dd-yyyy
    }
}

extension RewatchDatePickerViewController : UITableViewDelegate {
    
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backShowDetail" {
            let controller = segue.destination as! DetailViewController
            controller.date = selectedDate
            controller.movieTitle = movieTitle
        }
    }
}
