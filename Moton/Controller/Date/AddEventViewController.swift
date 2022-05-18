//
//  AddEventViewController.swift
//  Moton
//
//  Created by erlina ng on 17/05/22.
//

import UIKit

class AddEventViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var cancelLabel: UILabel!
    
    @IBOutlet weak var addLabel: UILabel!
    
    //Input Textfield (Movie Title & Location)
    @IBOutlet weak var inputTable: UITableView!
    
    //Input Alert & Repeat, Info Start time & End time

    @IBOutlet weak var timeInputTable: UITableView!
    
    var inputPlaceHolder = ["Title", "Home or Studio", "Notes"]
    
    var labelDatePicker = ["Start", "End"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTable()
        inputTable.delegate = self
        inputTable.dataSource = self
        timeInputTable.delegate = self
        timeInputTable.dataSource = self
        
        //Set Tableview Corner Radius 
        self.inputTable.layer.cornerRadius = 10.0
        self.timeInputTable.layer.cornerRadius = 10.0
        
        //If Cancel Label Tapped
        let cancelTapped = UITapGestureRecognizer(target: self, action: #selector(AddEventViewController.cancelTapFunction))
        cancelLabel.isUserInteractionEnabled = true
        cancelLabel.addGestureRecognizer(cancelTapped)
        
        //If Add Label Tapped
        let addTapped = UITapGestureRecognizer(target: self, action: #selector(AddEventViewController.addTapFunction))
        addLabel.isUserInteractionEnabled = true
        addLabel.addGestureRecognizer(addTapped)
        
    }
    
    //Untuk SetUp Table dengan Cell-nya
    func setUpTable () {
        // Cell Input Textfield
        let nibInputTextField = UINib(nibName: "AddEventTextFieldTableViewCell", bundle: nil)
      
        //Input Textfield ke Cell-nya
        inputTable.register(nibInputTextField, forCellReuseIdentifier: "inputCell")
        
        // Cell Input Datepicker
        let nibInputDatePicker = UINib(nibName: "AddEventDatePickerTableViewCell", bundle: nil)
      
        // Set Table Input Datepicker ke Cell-nya
        timeInputTable.register(nibInputDatePicker, forCellReuseIdentifier: "datePickerCell")
      
    }
    
    //Set ukuran height cell
    func tableView (_ tableView : UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.timeInputTable {
            return 55.0
        }
        return 45.0
    }
    
    @objc func cancelTapFunction(sender:UITapGestureRecognizer) {
            self.dismiss(animated: true, completion: nil)
            print("cancel label tapped")
    }
    
    @objc func addTapFunction (sender:UITapGestureRecognizer) {
        //Add data to event in Icalendar
        
        //
        self.dismiss(animated: true, completion: nil)
        print("add label tapped")
    }
}

extension AddEventViewController : UITableViewDataSource {
  
  // To return how many cell display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.inputTable {
            return inputPlaceHolder.count
        }
        else if tableView == self.timeInputTable {
            return labelDatePicker.count
        }
        return 0
    }
  
  //Cell's Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == self.inputTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell",for: indexPath) as! AddEventTextFieldTableViewCell
            let placeHolder = inputPlaceHolder[indexPath.row]
            
            cell.inputTextField.borderStyle = UITextField.BorderStyle.none
            cell.inputTextField.placeholder = placeHolder
            
            return cell
        } else if tableView == self.timeInputTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell",for: indexPath) as! AddEventDatePickerTableViewCell
            let labelDatePicker = labelDatePicker[indexPath.row]
            
            cell.labelDatePicker.text = labelDatePicker
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
