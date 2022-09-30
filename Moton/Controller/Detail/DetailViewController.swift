//
//  DetailViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit
import EventKit
import RxSwift

class DetailViewController: UIViewController {
    
    var date: Date?
    
    @IBOutlet weak var dateRecommendationTableView: UITableView!
    var selectedDateRecommendation: FreeTime?
    var movieTitle : String?
    
    private let bag = DisposeBag()
    private let viewModel = FreeTimeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = date?.yearMonthDayText
        dateRecommendationTableView
            .rx
            .setDelegate(self)
            .disposed(by: bag)
        
        bindTableView()
        setupCellTapHandling()
    }
    
}

extension DetailViewController {
    
    func bindTableView() {
        dateRecommendationTableView.register(UINib(nibName: "DateRecommendationTableViewCell", bundle: nil), forCellReuseIdentifier: dateRecommendationTableViewCellId)
        
        viewModel.listFreeTime.bind(to: dateRecommendationTableView.rx.items(cellIdentifier: dateRecommendationTableViewCellId, cellType: DateRecommendationTableViewCell.self)) {
            (row, item, cell) in
            cell.setCellWithValueOf(item)
        }.disposed(by: bag)
        
        guard let date = date else {
            return
        }
        viewModel.fetchFreeTime(date: date)
    }
    
    func setupCellTapHandling() {
        dateRecommendationTableView.rx.modelSelected(FreeTime.self).subscribe(onNext: {item in
            self.selectedDateRecommendation = item
            self.performSegue(withIdentifier: "showForm", sender: self.selectedDateRecommendation)
        }).disposed(by: bag)
    }
    
    func refreshData() {
        if let date = date {
            viewModel.fetchFreeTime(date: date)
        }
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showForm" {
            let controller = segue.destination as! UINavigationController
            let controllerTableView = controller.topViewController as! FormAddEventViewController
            controllerTableView.dateRecommendation = selectedDateRecommendation
            controllerTableView.reloadData = {
                self.refreshData()
            }
        }
    }
}

