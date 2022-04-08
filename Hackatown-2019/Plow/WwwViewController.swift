//
//  WwwViewController.swift
//  Plow
//
//  Created by Gabriel Somma on 18-01-20.
//  Copyright © 2018 The keys is to make it. All rights reserved.
//

import UIKit
import FirebaseDatabase

var What = ""
var Where = ""
var When = ""


class WwwViewController: UIViewController {
    
    @IBOutlet weak var needChoice: UISegmentedControl!
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var isNow: UISegmentedControl!
    
    
    @IBOutlet weak var dateLater: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickNext(_ sender: Any) {
        Where = Address.text!
        What = needChoice.titleForSegment(at: needChoice.selectedSegmentIndex)!
        
        if (isNow.description == "Now"){
            When = Date().description;
        }
        else{
            When = dateLater.description;
        }
        
        
        
        let info = Address.text
        
        var dbRef: DatabaseReference?
        dbRef = Database.database().reference()
        dbRef?.child("client").childByAutoId().setValue(info)
 
        
        let popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addInfo") as! AddInfoViewController
        
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
