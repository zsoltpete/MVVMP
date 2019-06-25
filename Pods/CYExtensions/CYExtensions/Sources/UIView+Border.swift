//
//  UIView+Border.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2017. 11. 17..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

/**
 Helping variables and functions to UIView.
 */
extension UIView {
    
    /**
     Add border around the view.
     
     - parameter color: The color of the border
     - parameter width: The width of the border
     */
    public func addBorder(color: UIColor = .black, width: CGFloat = 1.0){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
}
