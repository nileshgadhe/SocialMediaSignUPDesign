//
//  VerifyOptViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 22/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class VerifyOptViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var loginButton : UIButton!
    
    @IBOutlet weak var txtFieldOTPFirst: UITextField!
    @IBOutlet weak var txtFieldOTPSecond: UITextField!
    @IBOutlet weak var txtFieldOTPThird: UITextField!
    @IBOutlet weak var txtFieldOTPFour: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        initializeDedegate()
    }
    

    private func setUpView(){
    
        SetBorder().setButton(button: loginButton, cronerRadius: loginButton.frame.height/2)
        
        txtFieldOTPFirst.layer.cornerRadius = txtFieldOTPFirst.frame.height/2
        txtFieldOTPFirst.layer.borderWidth = 0.5
        txtFieldOTPFirst.layer.borderColor = UIColor.lightGray.cgColor
        
        txtFieldOTPSecond.layer.cornerRadius = txtFieldOTPFirst.frame.height/2
        txtFieldOTPSecond.layer.borderWidth = 0.5
        txtFieldOTPSecond.layer.borderColor = UIColor.lightGray.cgColor
        
        txtFieldOTPThird.layer.cornerRadius = txtFieldOTPThird.frame.height/2
        txtFieldOTPThird.layer.borderWidth = 0.5
        txtFieldOTPThird.layer.borderColor = UIColor.lightGray.cgColor
        
        txtFieldOTPFour.layer.cornerRadius = txtFieldOTPFour.frame.height/2
        txtFieldOTPFour.layer.borderWidth = 0.5
        txtFieldOTPFour.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    private func initializeDedegate(){
        
        txtFieldOTPFirst.delegate = self
        txtFieldOTPSecond.delegate = self
        txtFieldOTPThird.delegate = self
        txtFieldOTPFour.delegate = self
        
    }
    
    
    @IBAction func backButtonTepped(_ sendor : Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTepped(_ sendor : Any){
        let appdelegate = (UIApplication.shared.delegate as! AppDelegate)
        appdelegate.setHomeViewController()
    }
    
}


extension VerifyOptViewController{
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false}
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count <= 1
        
    }
    
}
