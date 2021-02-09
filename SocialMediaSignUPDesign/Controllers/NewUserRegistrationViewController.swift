//
//  NewUserRegistrationViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 23/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class NewUserRegistrationViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var showHidePassButton: UIButton!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    
    
    @IBOutlet weak var txtFieldUserName: UITextField!
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
    
        SetBorder().setButton(button: getStartedButton, cronerRadius: getStartedButton.frame.height/2)
        
        usernameContainerView.layer.cornerRadius = emailContainerView.frame.height/2
        usernameContainerView.layer.borderWidth = 0.5
        usernameContainerView.layer.borderColor = UIColor.lightGray.cgColor
        
        emailContainerView.layer.cornerRadius = emailContainerView.frame.height/2
        emailContainerView.layer.borderWidth = 0.5
        emailContainerView.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordContainerView.layer.cornerRadius = passwordContainerView.frame.height/2
        passwordContainerView.layer.borderWidth = 0.5
        passwordContainerView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    

    private func initializeDedegate(){
        
        txtFieldUserName.delegate = self
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
        
    }
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getStartedButtonTapped(_ sender: Any) {
        //ChooseLanguageViewController
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ChooseLanguageViewController") as? ChooseLanguageViewController
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


extension NewUserRegistrationViewController{
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
