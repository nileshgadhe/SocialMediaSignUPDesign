//
//  SelectAgeGroupTableViewCell.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class SelectAgeGroupTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.layer.borderWidth = 0.5
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
