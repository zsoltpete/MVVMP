//
//  UIColor+Hexa.swift
//  symblify-ios
//
//  Created by Zsolt Pete on 2017. 05. 18..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIColor.
 */
extension UIColor {
    
    /**
     Create an UIColor with decimal value of RGB.
     
     - parameter red: The red decimal value
     - parameter green: The green decimal value
     - parameter blue: The blue decimal value
     */
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Create an UIColor with hexa value of RGB.
     
     - parameter rgb: The hexa value of a color.  Example '0x1245AF'
     */
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
