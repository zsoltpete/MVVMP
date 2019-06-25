//
//  String+Height.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension String {
    
    /// Returns of string height.
    ///
    /// - Parameters:
    ///   - width: Label width where string will be presented.
    ///   - font: Font of label where string will be presented.
    /// - Returns: Returns of string height.
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /// Returns of string width.
    ///
    /// - Parameters:
    ///   - height: Label height where string will be presented.
    ///   - font: Font of label where string will be presented.
    /// - Returns: Returns of string width.
    public func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension NSAttributedString {
    
    /// Returns of string height.
    ///
    /// - Parameter width: Label width where string will be presented.
    /// - Returns: Returns of string height.
    public func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /// Returns of string width.
    ///
    /// - Parameter height: Label height where string will be presented.
    /// - Returns: Returns of string width.
    public func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}
