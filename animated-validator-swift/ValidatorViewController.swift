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
    
    @IBOutlet weak var submitButtonCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailConfirmWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConfirmWidthConstraint: NSLayoutConstraint!
    
    
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
        let goodPhone = self.phoneTextField.text?.characters.count >= 7
        let goodPassword = self.passwordTextField.text?.characters.count >= 6
        let goodPasswordConfirm = self.passwordConfirmTextField.text == self.passwordTextField.text && self.passwordConfirmTextField.text?.characters.count > 0
        
        
        if textField === self.emailTextField {
            
            if goodText && goodEmail {
                
                self.emailTextField.backgroundColor = UIColor.whiteColor()
                
            }else{
                
                pulseTextField(self.emailTextField)
                
            }
            
        }else if textField === self.emailConfirmationTextField{
            
            if goodEmailConfirm && goodEmail{
                
                self.emailConfirmationTextField.backgroundColor = UIColor.whiteColor()
            }else{
                pulseTextField(self.emailConfirmationTextField)
                
            }
        }else if textField === self.phoneTextField{
            
            if  goodPhone{
                
                self.phoneTextField.backgroundColor = UIColor.whiteColor()
            }else{
                pulseTextField(self.phoneTextField)
            }
            
        }else if textField === self.passwordTextField {
                
            if  goodPassword{
                
                self.passwordTextField.backgroundColor = UIColor.whiteColor()
            }else{
                
                pulseTextField(self.passwordTextField)
            }
        }else if textField === self.passwordConfirmTextField{
            
            if goodPasswordConfirm && goodPassword{
                
                self.passwordConfirmTextField.backgroundColor = UIColor.whiteColor()
            }else{
                
                pulseTextField(self.passwordConfirmTextField)
            }
        }
        
        if goodPasswordConfirm && goodPassword && goodPhone && goodEmailConfirm && goodEmail && goodText {
            self.submitButton.enabled = true
            moveButton()
        }
    }
    
    func moveButton(){
        
        UIView.animateWithDuration(1) {
            
            self.submitButtonCenterYConstraint.constant = -45
        
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    func pulseTextField(textField: UITextField) {
        
        let savedText = textField.text
        textField.text = nil
        
        UIView.animateKeyframesWithDuration(0.25, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            
            UIView.setAnimationRepeatCount(3.0)
            textField.transform = CGAffineTransformMakeScale(0.98, 0.98)
            textField.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
            
            }) { (true) in
                textField.transform = CGAffineTransformMakeScale(1, 1)
                textField.text = savedText
        }

    }
    
}