//
//  DateTableViewCell.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 20/05/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {

  @IBOutlet weak var timeLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
