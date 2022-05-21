//
//  ScheduleViewController.swift
//  Moton
//
//  Created by Tubagus Adhitya Permana on 20/05/22.
//

import UIKit

class ScheduleViewController: UIViewController {
  
  @IBOutlet weak var titleSchedule: UILabel!
  @IBOutlet weak var notesSchedule: UILabel!
  @IBOutlet weak var dateDurationSchedule: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleSchedule.text = "Upin Ipin"
    notesSchedule.text = "Home"
    dateDurationSchedule.text = "Tus, 4 May 2022, 09:00 - 12:00"
  }
}


