//
//  PhotoGalleryCollectionViewCell.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 25/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class PhotoGalleryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
        
    }

}
