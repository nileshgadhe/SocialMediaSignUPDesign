//
//  SelectOneModel.swift
//  qualiffy
//
//  Created by Nilesh Gadhe on 24/06/20.
//  Copyright © 2020 omsoftware. All rights reserved.
//

import Foundation

class SelectOneModel : NSObject{
    
    var name : String?
    var isSelectec : Bool?
    
    init(name : String, isSelectec : Bool) {
        self.name = name
        self.isSelectec = isSelectec
    }
 
    
}
