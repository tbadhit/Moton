//
//  UITableView+Ext.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 03/09/22.
//

import UIKit

extension UITableView {
  func setEmptyMessage(_ message1: String,_ message2: String) {
    
    let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
    
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textColor = UIColor.lightGray
    titleLabel.font = UIFont(name: "SF-Pro", size: 17)
    messageLabel.textColor = UIColor.lightGray
    messageLabel.font = UIFont(name: "SF-Pro", size: 17)
    
    emptyView.addSubview(titleLabel)
    emptyView.addSubview(messageLabel)
    
    titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
    
    messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
    messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
    
    titleLabel.text = message1
    messageLabel.text = message2
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    // The only tricky part is here:
    self.backgroundView = emptyView
    self.separatorStyle = .none
    
  }
  
  func restore() {
    self.backgroundView = nil
    self.separatorStyle = .singleLine
  }
}
