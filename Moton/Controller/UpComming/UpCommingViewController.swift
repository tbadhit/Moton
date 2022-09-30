//
//  UpCommingViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit
import EventKit
import RxSwift

class UpCommingViewController: UIViewController {
    
    @IBOutlet weak var upCommingtableView: UITableView!
    var selectedMovieTitle: String?
    var selectedNotes : String?
    
    let viewModel = UpCommingViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upCommingtableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
        setupCellTapHandling()
    }
    
    func bindTableView () {
        let nibDateRecommendation = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        upCommingtableView.register(nibDateRecommendation, forCellReuseIdentifier: scheduleTableViewCellId)
        
            viewModel.listUpComming.bind(to: upCommingtableView.rx.items(cellIdentifier: scheduleTableViewCellId, cellType: ScheduleTableViewCell.self)) {
                (row, item, cell) in
                cell.setCellWithValueOf(item)
            }.disposed(by: bag)
        
        viewModel.fetchUpComming()
    }
    
    func setupCellTapHandling() {
        upCommingtableView.rx.modelSelected(Schedule.self).subscribe(onNext: {item in
            self.selectedMovieTitle = item.title
            self.selectedNotes = item.note
            self.performSegue(withIdentifier: "showTitleDetail", sender: self.selectedMovieTitle)
        }).disposed(by: bag)
    }
}
//
//extension UpCommingViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if upCommingList.count == 0 {
//            tableView.setEmptyMessage("You have no upcoming schedule,", "you need to schedule it first!")
//        } else {
//            tableView.restore()
//        }
//        return upCommingList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellId, for: indexPath) as? ScheduleTableViewCell {
//            let upComming = upCommingList[indexPath.row]
//            cell.setCellWithValueOf(upComming)
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//    }
//
//}

extension UpCommingViewController : UITableViewDelegate {
    
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedMovieTitle = upCommingList[indexPath.row].title
//        selectedNotes = upCommingList[indexPath.row].note
//        performSegue(withIdentifier: "showTitleDetail", sender: selectedMovieTitle)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTitleDetail" {
            
            let controller = segue.destination as! ShowTitleViewController
            
            controller.movieTitle = selectedMovieTitle?.components(separatedBy: "Moton - ")[1]
            controller.notes = selectedNotes
            
        }
    }
}

