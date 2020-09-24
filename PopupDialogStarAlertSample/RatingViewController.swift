//
//  RatingViewController.swift
//  PopupDialogStarAlertSample
//
//  Created by 清水智貴 on 2020/09/24.
//

import UIKit
import Cosmos

class RatingViewController: UIViewController {
    
    @IBOutlet weak var cosmosStarRating: CosmosView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cosmosStarRating.rating = 3.0
        commentTextField.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
}

extension RatingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
}
