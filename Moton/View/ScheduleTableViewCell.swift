//
//  UpCommingTableViewCell.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleUpComming: UILabel!
    @IBOutlet weak var noteUpComming: UILabel!
    @IBOutlet weak var dateDurationUpComming: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    func setCellWithValueOf(_ schedule: Schedule) {
        updateUI(title: schedule.title.components(separatedBy: "Moton - ")[1], note: schedule.note, startDate: schedule.startDate.monthDayTimeText, endDate: schedule.endDate.time)
    }
    
    private func updateUI(title: String, note: String, startDate: String, endDate: String) {
        self.titleUpComming.text = title
        self.noteUpComming.text = note
        self.dateDurationUpComming.text = "\(startDate) - \(endDate)"
        self.containerView.layer.cornerRadius = 10
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
