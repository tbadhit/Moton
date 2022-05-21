//
//  FormAddEventViewController.swift
//  Moton
//
//  Created by erlina ng on 20/05/22.
//

import UIKit

class FormAddEventViewController: UITableViewController {

  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var notesField: UITextField!
  @IBOutlet weak var startTimePicker: UIDatePicker!
  @IBOutlet weak var endTimePicker: UIDatePicker!
  override func viewDidLoad() {
        super.viewDidLoad()
    
//    titleField.text = "Testingg"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
