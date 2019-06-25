//
//  UIImage+Extensions.swift
//  insimu-ios
//
//  Created by Eszenyi Gabor on 2017. 07. 12..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIImage.
 */
extension UIImage {

    /**
     Create an image with a specific color with masking.

     - parameter color: The color what will use to mask.

     - returns: An image if the masking is successful.
     */
    public func transform(withNewColor color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: rect, mask: cgImage!)
        
        color.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    /**
     Create an image with a specific color with masking.

     - parameter color: The color what will use to mask.

     - returns: Nil if there is no result of the masking, an image if the masking is successful.
    */
    public func maskWithColor(color: UIColor) -> UIImage? {
        
        let maskLayer = CALayer()
        maskLayer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        maskLayer.backgroundColor = color.cgColor
        maskLayer.doMask(by: self)
        let maskImage = maskLayer.toImage()
        return maskImage
    }
}
