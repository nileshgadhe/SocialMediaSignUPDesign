//
//  SignUpViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 22/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var socialMediaButton : UIButton!
    @IBOutlet weak var signWithEmailButton : UIButton!
    @IBOutlet weak var newUserButton : UIButton!
    
    @IBOutlet weak var closeButton : UIButton!
    @IBOutlet weak var appleSignInButton : UIButton!
    @IBOutlet weak var scapchatSignInButton : UIButton!
    @IBOutlet weak var linkedInSignInButton : UIButton!
    @IBOutlet weak var instagramSignInButton : UIButton!
    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var socialMediaContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    private func setUpView(){
        
        SetBorder().setButtonWithoutBorder(button: socialMediaButton, cronerRadius: socialMediaButton.frame.height/2)
        SetBorder().setButton(button: signWithEmailButton, cronerRadius: signWithEmailButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: newUserButton, cronerRadius: newUserButton.frame.height/2)
        
        SetBorder().setButtonWithoutBorder(button: appleSignInButton, cronerRadius: appleSignInButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: scapchatSignInButton, cronerRadius: scapchatSignInButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: linkedInSignInButton, cronerRadius: linkedInSignInButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: instagramSignInButton, cronerRadius: instagramSignInButton.frame.height/2)
        
        SetBorder().setButtonWithoutBorder(button: closeButton, cronerRadius: closeButton.frame.height/2)
        mainContainerView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        mainContainerView.isHidden = true
        
        socialMediaContainerView.layer.cornerRadius = 10
    }

    @IBAction func buttonSocialMediaTapped(_ sendor: Any){
        mainContainerView.isHidden = false
        
    }
    
    @IBAction func signWithGmailTapped(_ sendor: Any){
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "LoginWithPhoneViewController") as? LoginWithPhoneViewController
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func newUserTapped(_ sendor: Any){
        //NewUserRegistrationViewController
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "NewUserRegistrationViewController") as? NewUserRegistrationViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func colseButtonTapped(_ sendor: Any){
        mainContainerView.isHidden = true
        
    }
    

}
