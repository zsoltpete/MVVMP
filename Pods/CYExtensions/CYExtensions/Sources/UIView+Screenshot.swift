//
//  UIView+ScreenShot.swift
//  symblify-ios
//
//  Created by Zsolt Pete on 2017. 08. 02..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIView.
 */
extension UIView {
    
    /**
     Create an image from the view itself
     
     - returns: An image from the actual view
     */
    public func takeScreenshot() -> UIImage{
        let layer = self.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshot!
    }
}

