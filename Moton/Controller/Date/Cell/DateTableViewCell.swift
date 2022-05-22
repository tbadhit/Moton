//
//  DateTableViewCell.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 20/05/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var timeLabel: UILabel!
  
  let cellView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.red
    view.layer.cornerRadius = 10
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
//    setUpView()
  }
  
  required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
  }
  
  func setUpView() {
    
    NSLayoutConstraint.activate([
      cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
      cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
      cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
