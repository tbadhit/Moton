//
//  WatchHistoryViewController.swift
//  Moton
//
//  Created by Fritzie Primananda Adi Praja on 16/05/22.
//

import UIKit
import EventKit
import RxSwift

class WatchHistoryViewController: UIViewController {
    
    @IBOutlet weak var historyListTable: UITableView!
    
    var historyList: [Schedule] = []
    var selectedMovieTitle: String?
    let viewModel = WatchHistoryViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyListTable.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
        setupCellTapHandling()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchWatchHistory()
    }
    
    func bindTableView() {
        let nibSchedule = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        historyListTable.register(nibSchedule, forCellReuseIdentifier: scheduleTableViewCellId)
        viewModel.listWatchHistory.bind(to: historyListTable.rx.items(cellIdentifier: scheduleTableViewCellId, cellType: ScheduleTableViewCell.self)) {
            (row, item, cell) in
            cell.setCellWithValueOf(item)
        }.disposed(by: bag)
        
        
        viewModel.fetchWatchHistory()
    }
    
    func setupCellTapHandling() {
        historyListTable.rx.modelSelected(Schedule.self).subscribe(onNext: { item
            in
            self.selectedMovieTitle = item.title
            self.performSegue(withIdentifier: "showRewatchDate", sender: nil)
        }).disposed(by: bag)
    }
}

//extension WatchHistoryViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if historyList.count == 0 {
//            tableView.setEmptyMessage("You haven't watch,", "you need to schedule it first!")
//        } else {
//            tableView.restore()
//        }
//        return historyList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellId, for: indexPath) as? ScheduleTableViewCell {
//            let history = historyList[indexPath.row]
//            cell.setCellWithValueOf(history)
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//    }
//}

extension WatchHistoryViewController : UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRewatchDate" {
            let controller = segue.destination as! RewatchDatePickerViewController
            selectedMovieTitle = selectedMovieTitle?.components(separatedBy: "Moton - ")[1]
            controller.movieTitle = selectedMovieTitle
        }
    }
}

