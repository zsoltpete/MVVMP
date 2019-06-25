//
//  UIView+GlobalPoint.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 04. 10..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Return a point global point of the screen
    public var globalPoint: CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    /// Retuns a frame which is global frame on the screen
    public var globalFrame: CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
}
