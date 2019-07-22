//
//  ViewController.swift
//  sideMenututorial
//
//  Created by The App Experts on 18/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
  
  @IBOutlet weak var countryCodeTextField: UITextField!
  
  @IBOutlet weak var phoneNumberTextField: UITextField!


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
  }

  @IBAction func sendVerification(_ sender: Any?) {
    
    if let phoneNumber = phoneNumberTextField.text, let countryCode = countryCodeTextField.text {
      VerifyAPI.sendVerificationCode(phoneNumber, countryCode)
      
     // PhoneNumberValidate.validate(text: phoneNumber)
  }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let destinationVC = segue.destination as? PhoneValidationViewController {
      destinationVC.countryCode = countryCodeTextField.text
      destinationVC.phoneNumber = phoneNumberTextField.text
      
    }
  }
  
  
}

// Mark: - Validation

protocol TextValidation {
  
  func validate(_ text: String) -> Bool
}

class PhoneNumberValidate: TextValidation {
  
  // simply checks if has 11 charatcers needs to be changed to something more strict. 
  func validate(_ text: String) -> Bool {
    
    // Remove empty spaces
    let trimmedText = text.replacingOccurrences(of: " ", with: "")
    
    // Check if string onyl has numbers...the easy way
    if Int(trimmedText) == nil { return false }
    
    // Check the length
    if trimmedText.count == 11 {
      return true
    } else {
      return false
      }
  }
}


// MARK: - Textfield delegate

// to make the textfield disappear once user finished using
extension LoginScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
    textfield.resignFirstResponder()
    return true
  }
}
