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
    
    override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
