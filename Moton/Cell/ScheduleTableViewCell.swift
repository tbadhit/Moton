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
    
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
