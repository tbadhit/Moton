//
//  ShowTitleViewController.swift
//  Moton
//
//  Created by erlina ng on 22/05/22.
//

import UIKit

class ShowTitleViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel : UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var detailView: UIView!
    
    var movieTitle : String?
    var notes : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitleLabel.text = movieTitle
        notesLabel.text = notes
        detailView.layer.cornerRadius = 10
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
