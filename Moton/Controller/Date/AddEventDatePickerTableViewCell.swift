//
//  AddEventDatePickerTableViewCell.swift
//  Moton
//
//  Created by erlina ng on 18/05/22.
//

import UIKit

class AddEventDatePickerTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var labelDatePicker: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
