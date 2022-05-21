//
//  UpCommingTableViewCell.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 21/05/22.
//

import UIKit

class UpCommingTableViewCell: UITableViewCell {
    
  @IBOutlet weak var titleUpComming: UILabel!
  @IBOutlet weak var noteUpComming: UILabel!
  @IBOutlet weak var dateDurationUpComming: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
