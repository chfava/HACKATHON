//
//  ServicesViewController.swift
//  Plow
//
//  Created by Charles-Olivier Presario on 2018-01-21.
//  Copyright © 2018 The keys is to make it. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    @IBOutlet weak var towingButton: UISwitch!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true;
        textBox.isHidden = true;
        self.hideKeyboardWhenTappedAround() 

        // Do any additional setup after loading the view.
    }

    @IBAction func showOptions(_ sender: Any) {
        label.isHidden = !label.isHidden;
        textBox.isHidden = !textBox.isHidden;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
