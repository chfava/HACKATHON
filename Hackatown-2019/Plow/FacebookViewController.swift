//
//  FacebookViewController.swift
//  Plow
//
//  Created by Gabriel Somma on 18-01-20.
//  Copyright © 2018 The keys is to make it. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FacebookViewController: UIViewController {

    @IBOutlet weak var singInSelector: UISegmentedControl!
    
    @IBOutlet weak var SingInLabel: UILabel!
    
    @IBOutlet weak var EmailTextFeild: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var SingInButton: UIButton!
    
    var IsSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        EmailTextFeild.delegate = self
        passwordtextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SingInSelectorChange(_ sender: UISegmentedControl) {
        
        IsSignIn = !IsSignIn
        
        if (IsSignIn)
        {
            SingInLabel.text = "Sign In"
            SingInButton.setTitle("Sign In", for: .normal)
        }
        else
        {
            SingInLabel.text = "Register"
            SingInButton.setTitle("Register", for: .normal)
        }
    }
    @IBAction func SingInButtonTapped(_ sender: UIButton) {
        let email = EmailTextFeild.text
        let pass = passwordtextField.text
            if IsSignIn {
                print(IsSignIn)
                if (email!.isEmpty || pass!.isEmpty){}
                else {
                    Auth.auth().signIn(withEmail: email!, password: pass!)
                        {(user, error) in
                            self.performSegue(withIdentifier: "goToHome", sender: self)
                        }
                        }
                    }
            else {
                print(IsSignIn)
                if (email!.isEmpty || pass!.isEmpty){}
                else {
                    Auth.auth().createUser(withEmail: email!, password: pass!) { (user, error) in
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                }
            }
        /*
        if (EmailTextFeild.text!.isEmpty || passwordtextField.text!.isEmpty)
        {
        }
        else {
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }*/

    }
}
extension FacebookViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
