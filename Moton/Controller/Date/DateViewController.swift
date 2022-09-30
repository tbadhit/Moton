//
//  ViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 14/05/22.
import UIKit
import EventKit
import RxSwift

class DateViewController: UIViewController {
    
    @IBOutlet weak var dateRecomTableView: UITableView!
    var selectedDate: Date?
    
    let viewModel = DateViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateRecomTableView.rx.setDelegate(self).disposed(by: bag)
        setupCellTapHandling()
        bindTableView()
        requestAccessCalendar()
    }
    
    func bindTableView () {
        let nibDateRecommendation = UINib(nibName: "DateTableViewCell", bundle: nil)
        dateRecomTableView.register(nibDateRecommendation, forCellReuseIdentifier: dateTableViewCellId)
        
            viewModel.listDateRecommendation.bind(to: dateRecomTableView.rx.items(cellIdentifier: dateTableViewCellId, cellType: DateTableViewCell.self)) {
                (row, item, cell) in
                cell.setCellWithValueOf(item)
            }.disposed(by: bag)
        
        viewModel.generateListDateRecommendation()
    }
    
    func setupCellTapHandling() {
        dateRecomTableView.rx.modelSelected(Date.self).subscribe(onNext: {item in
            self.selectedDate = item
            self.performSegue(withIdentifier: "showDetail", sender: self.selectedDate)
        }).disposed(by: bag)
    }
    
    func requestAccessCalendar() {
        EventStore.shared.requestAccess(to: .event) { success, error in
            if success && error == nil {
                print("Success")
            } else {
                print("Error")
            }
        }
    }
    
}


extension DateViewController: UITableViewDelegate {
    
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as! DetailViewController
            controller.date = selectedDate
        }
    }
}

