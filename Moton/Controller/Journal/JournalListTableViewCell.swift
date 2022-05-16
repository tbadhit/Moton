//
//  JournalListTableViewCell.swift
//  Moton
//
//  Created by erlina ng on 16/05/22.
//

import UIKit

class JournalListTableViewCell: UITableViewCell {
  
  //Watching Date Label
  @IBOutlet weak var dateLabel: UILabel!
  
  //Watching Time Label
  @IBOutlet weak var timeLabel: UILabel!
  
  //Movie Title Label
  @IBOutlet weak var titleLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
