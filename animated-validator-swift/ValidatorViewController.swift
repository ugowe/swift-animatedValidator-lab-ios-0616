//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
    
    }
    
    func textFieldDidEndEditing(textField: UITextField) {

        isValidText(textField)
        
    }
    
    func isValidText(textField: UITextField){
        
        let goodText = textField.text!.characters.count > 0
        let goodEmail = self.emailTextField.text!.containsString("@") && self.emailTextField.text!.containsString(".")
        let goodEmailConfirm = self.emailConfirmationTextField.text == self.emailTextField.text && self.emailConfirmationTextField.text!.characters.count > 0
        let goodPhone = self.phoneTextField.text?.characters.count == 7
        let goodPassword = self.passwordTextField.text?.characters.count >= 6
        let goodPasswordConfirm = self.passwordConfirmTextField.text == self.passwordTextField.text && self.passwordConfirmTextField.text?.characters.count > 0
        
        
        if textField === self.emailTextField {
            
            if !goodText || !goodEmail {
                
                textField.backgroundColor = UIColor.redColor()
                
            }else{
                
                textField.backgroundColor = UIColor.whiteColor()
            }
            
        }else if textField === self.emailConfirmationTextField{
            
            if goodEmailConfirm{
                
                self.emailConfirmationTextField.backgroundColor = UIColor.whiteColor()
            }else{
                
                self.emailConfirmationTextField.backgroundColor = UIColor.redColor()
            }
        }else if textField === self.phoneTextField{
            
            if  goodPhone{
                
                self.phoneTextField.backgroundColor = UIColor.whiteColor()
            }else{
                self.phoneTextField.backgroundColor = UIColor.redColor()
            }
            
        }else if textField === self.passwordTextField {
                
            if  goodPassword{
                
                self.passwordTextField.backgroundColor = UIColor.whiteColor()
            }else{
                
                self.passwordTextField.backgroundColor = UIColor.redColor()
            }
        }else if textField === self.passwordConfirmTextField{
            
            if goodPasswordConfirm{
                
                self.passwordConfirmTextField.backgroundColor = UIColor.whiteColor()
            }else{
                
                self.passwordConfirmTextField.backgroundColor = UIColor.redColor()
            }
        }
        
        if goodPasswordConfirm && goodPassword && goodPhone && goodEmailConfirm && goodEmail && goodText {
            self.submitButton.enabled = true
            moveButton()
        }
    }
    
    func moveButton(){
        
        UIView.animateWithDuration(1) {
            
            self.submitButton.centerYAnchor
            self.submitButton.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: -45).active = true
            self.view.layoutIfNeeded()
            
        }
        
    }
  
}
