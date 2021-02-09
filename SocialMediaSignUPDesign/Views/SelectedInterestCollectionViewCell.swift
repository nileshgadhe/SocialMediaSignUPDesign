//
//  SelectedInterestCollectionViewCell.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class SelectedInterestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblInterest: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.frame.height/2
        //containerView.layer.borderWidth = 0.5
        //containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        imgView.layer.cornerRadius = imgView.frame.height/2
        //imgView.layer.borderWidth = 0.5
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
    }

}
