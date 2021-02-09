//
//  GlobalFunctions.swift
//  swapnpurtee
//
//  Created by Codepix on 12/02/20.
//  Copyright © 2020 codepix solutions. All rights reserved.
//

import Foundation
import UIKit


/*
func isInternetAvailable() -> Bool {
    
    let reachability = Reachability.forInternetConnection()
    let networkStatus = reachability?.currentReachabilityStatus()
    
    return !(networkStatus == .NotReachable)
}
*/

//Functins

class SetBorder{
    
    internal func setButton(button: UIButton, cronerRadius : CGFloat) {
        //button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = cronerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
    }

    internal func setButtonWithoutBorder(button: UIButton, cronerRadius : CGFloat) {
        //button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = cronerRadius
        //button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    internal func setCared(view: UIView, cronerRadius : CGFloat) {
        //button.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = cronerRadius
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
}




extension UIViewController {
    
    func alertView(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


//MARK- Extention for color
extension UIColor {
    
    // A UIColor class method to create colors from hex values conveniently
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

@IBDesignable
extension UITextField {
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
}


