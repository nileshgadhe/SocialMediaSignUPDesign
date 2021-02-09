//
//  ChooseLanguageViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 23/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class ChooseLanguageViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var searchContainerView: UIView!
    
    @IBOutlet weak var englishLangButton: UIButton!
    @IBOutlet weak var prenchLangButton: UIButton!
    @IBOutlet weak var bhartiyLangButton: UIButton!
    
    @IBOutlet weak var txtFieldSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        initializeDedegate()
    }
    
    func setUpView(){
    
        SetBorder().setButton(button: nextButton, cronerRadius: nextButton.frame.height/2)
        
        SetBorder().setButtonWithoutBorder(button: englishLangButton, cronerRadius: englishLangButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: prenchLangButton, cronerRadius: prenchLangButton.frame.height/2)
        SetBorder().setButtonWithoutBorder(button: bhartiyLangButton, cronerRadius: bhartiyLangButton.frame.height/2)
        
        searchContainerView.layer.cornerRadius = searchContainerView.frame.height/2
        searchContainerView.layer.borderWidth = 0.5
        searchContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func initializeDedegate(){
        
        txtFieldSearch.delegate = self
    
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SelectOneViewController") as? SelectOneViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
    
}


extension ChooseLanguageViewController{
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
