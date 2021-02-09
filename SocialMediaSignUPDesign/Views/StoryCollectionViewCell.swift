//
//  StoryCollectionViewCell.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 25/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
        imgView.layer.backgroundColor = UIColor.lightGray.cgColor
        imgView.layer.borderWidth = 1
    }

}
