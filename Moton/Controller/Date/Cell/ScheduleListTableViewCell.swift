//
//  ScheduleListTableViewCell.swift
//  Moton
//
//  Created by erlina ng on 16/05/22.
//

import UIKit

class ScheduleListTableViewCell: UITableViewCell {
  
  //Movie Title Label
  @IBOutlet weak var titleLabel: UILabel!
  
  //Date & Time Watching Label
  @IBOutlet weak var dateTimeLabel: UILabel!
  
  //Notes label (Shows watching with whom)
  @IBOutlet weak var notesLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
