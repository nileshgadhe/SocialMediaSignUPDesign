//
//  ViewStoryViewController.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 26/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class ViewStoryViewController: UIViewController {

    
    @IBOutlet weak var profileImgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
    }
    
    func setView(){
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
