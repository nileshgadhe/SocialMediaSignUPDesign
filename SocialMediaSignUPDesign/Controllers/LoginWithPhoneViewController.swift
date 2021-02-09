//
//  LoginWithPhoneViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 22/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class LoginWithPhoneViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var doneButton: UIButton!
   
    @IBOutlet weak var showHidePassButton: UIButton!
    @IBOutlet weak var phoneContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    
    
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    
    private var passwordIconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        initializeDedegate()
    }
    
    
    
    private func setUpView(){
    
        SetBorder().setButton(button: doneButton, cronerRadius: doneButton.frame.height/2)
        phoneContainerView.layer.cornerRadius = phoneContainerView.frame.height/2
        phoneContainerView.layer.borderWidth = 0.5
        phoneContainerView.layer.borderColor = UIColor.lightGray.cgColor
        emailContainerView.layer.cornerRadius = emailContainerView.frame.height/2
        emailContainerView.layer.borderWidth = 0.5
        emailContainerView.layer.borderColor = UIColor.lightGray.cgColor
        passwordContainerView.layer.cornerRadius = passwordContainerView.frame.height/2
        passwordContainerView.layer.borderWidth = 0.5
        passwordContainerView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    private func initializeDedegate(){
        
        txtFieldPhone.delegate = self
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
    }
    
    
    @IBAction func backButtonTapped(_ sendor : Any){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func doneButtonTapped(_ sendor : Any){
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "VerifyOptViewController") as? VerifyOptViewController
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func showHidePassButtonTapped(_ sender: Any) {
        
        if(passwordIconClick == true) {
            txtFieldPassword.isSecureTextEntry = false
            showHidePassButton.setImage(UIImage(named: "ic_eye_open"), for: .normal)
            
        } else {
            txtFieldPassword.isSecureTextEntry = true
            showHidePassButton.setImage(UIImage(named: "ic_eye_off"), for: .normal)
        }

        passwordIconClick = !passwordIconClick
    }
    
}


extension LoginWithPhoneViewController{
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
