//
//  MenuCollectionViewCell.swift
//  CedarRapidNew
//
//  Created by bitcode on 27/02/20.
//  Copyright © 2020 in.bitcode. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var bgBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = UIColor.lightGray
//        imageView.contentMode = .scaleAspectFit
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
       
//        bgBtn.clipsToBounds = true
//        bgBtn.layer.cornerRadius = bgBtn.bounds.height/2
//        bgBtn.layer.borderColor = UIColor.white.cgColor
//        bgBtn.layer.borderWidth = 1

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit

        
        layoutIfNeeded()
    }
    

}
