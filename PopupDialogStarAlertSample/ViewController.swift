//
//  ViewController.swift
//  PopupDialogStarAlertSample
//
//  Created by 清水智貴 on 2020/09/24.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showCustomDialog(animated: Bool = true) {
        
        // Create a custom view controller
        let ratingVC = RatingViewController(nibName: "RatingViewController", bundle: nil)
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL", height: 60) {
            self.label.text = "You canceled the rating dialog"
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "RATE", height: 60) {
            self.label.text = "You rated \(ratingVC.cosmosStarRating.rating) stars"
            self.commentLabel.text = ratingVC.commentTextField.text
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
    
    @IBAction func showCustomDialogTapped(_ sender: UIButton) {
        showCustomDialog()
    }
    
}

