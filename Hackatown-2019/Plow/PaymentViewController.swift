//
//  PaymentViewController.swift
//  Plow
//
//  Created by Gabriel Somma on 18-01-20.
//  Copyright © 2018 The keys is to make it. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    @IBOutlet weak var cardNumberTextBox: UITextField!
    
    @IBOutlet weak var dateMonthTextBox: UITextField!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var dateYearTextBox: UITextField!
    @IBOutlet weak var CCVTextBox: UITextField!
    var transitionAllowed:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        cardNumberTextBox.keyboardType = UIKeyboardType.numberPad

        cardName.delegate = self
        cardNumberTextBox.delegate = self
        CCVTextBox.delegate = self
        dateYearTextBox.delegate = self
        dateMonthTextBox.delegate = self
        
        dateMonthTextBox.keyboardType = UIKeyboardType.numberPad
        dateYearTextBox.keyboardType = UIKeyboardType.numberPad
        CCVTextBox.keyboardType = UIKeyboardType.numberPad
        
        transitionAllowed = true;
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func showPopUp(_ sender: Any) {
        transitionAllowed = (cardNumberTextBox.text?.count == 16 && cardName.text != "" && dateYearTextBox.text?.count == 02 && CCVTextBox.text?.count == 3 && dateMonthTextBox.text?.count == 2)
        
        if (transitionAllowed == true){
            let popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
        
            self.addChildViewController(popUp)
            popUp.view.frame = self.view.frame
            self.view.addSubview(popUp.view)
            popUp.didMove(toParentViewController: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } 
}

extension PaymentViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case cardNumberTextBox:
            if ((textField.text!.count) + (string.count - range.length)) > 16 {
                return false
            }
        case CCVTextBox:
            if ((textField.text!.count) + (string.count - range.length)) > 3 {
                return false
            }
        case dateMonthTextBox:
            if ((textField.text!.count) + (string.count - range.length)) > 2 {
                return false
            }
        case dateYearTextBox:
            if ((textField.text!.count) + (string.count - range.length)) > 2 {
                return false
            }
        default :
            return true
        }
        return true
    }
    
}
