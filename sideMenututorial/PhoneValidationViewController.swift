//
//  PhoneValidationViewController.swift
//  sideMenututorial
//
//  Created by The App Experts on 18/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class PhoneValidationViewController: UIViewController {
  
  @IBOutlet var codeField: UITextField!
  
  @IBOutlet var statusLabel: UILabel!
  
  var countryCode: String? 
  var phoneNumber: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  
  @IBAction func validateCode(_ sender: Any) {
    
    self.statusLabel.text = nil
    self.statusLabel.isHidden = true
    
    if let code = codeField.text {
      VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code){ checked in
        
        if(checked.success) {
          // set to green to show success to show a positive results
          self.statusLabel.textColor = .green
          self.statusLabel.text = "verififcaton sucesfful"
          self.statusLabel.isHidden = false
          
        } else {
          
          // change to red to show unsuccesful
          self.statusLabel.textColor = .red
          self.statusLabel.text = checked.message
          self.statusLabel.isHidden = false
        }
      }
    }
  }
  


}
