//
//  UIViewController+SeperatorRemover.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension NSObject {
    
    /// Detect a specific index of a collection is last or not.
    ///
    /// - Parameters:
    ///   - collection: Collection what will be searched.
    ///   - index: Specific index of collection
    /// - Returns: Is index last or not of collection
    public func isLastIn(collection: [Any], index: Int) -> Bool {
        let count = collection.count
        if count - 1 == index {
            return true
        } else {
            return false
        }
    }
    
}

/// Protocol which contain seperator view.
public protocol SeperatorOwning {
    
    /// Seperator view
    var seperatorView: UIView! { get set }
    
    /// Hide seperator view
    ///
    /// - Parameter hidden: Seperator view has to hide or not.
    func hideSeperator(_ hidden: Bool)
    
}

extension SeperatorOwning {
    
    public func hideSeperator(_ hidden: Bool) {
        self.seperatorView.isHidden = hidden
    }
    
}

