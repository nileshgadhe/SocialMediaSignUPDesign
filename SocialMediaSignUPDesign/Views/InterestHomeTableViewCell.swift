//
//  InterestHomeTableViewCell.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 25/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import UIKit

class InterestHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = containerView.frame.height/2
        //containerView.layer.borderWidth = 0.5
        //containerView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
