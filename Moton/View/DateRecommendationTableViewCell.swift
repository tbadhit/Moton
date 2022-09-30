//
//  DateRecommendationTableViewCell.swift
//  Moton
//
//  Created by erlina ng on 16/05/22.
//

import UIKit

class DateRecommendationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    func setCellWithValueOf(_ dateRecommendation: FreeTime) {
        updateUI(duration: dateRecommendation.duration, startTime: dateRecommendation.startTime.time, endTime: dateRecommendation.endTime.time)
    }
    
    private func updateUI(duration: Int, startTime: String, endTime: String) {
        self.dateLabel.text = "Total Duration: \(duration) hours"
        self.timeLabel.text = "\(startTime) - \(endTime)"
        self.containerView.layer.cornerRadius = 10
    }
    
    //    override func awakeFromNib() {
    //    super.awakeFromNib()
    //    // Initialization code
    //  }
    //
    //  override func setSelected(_ selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)
    //
    //    // Configure the view for the selected state
    //  }
    
}
