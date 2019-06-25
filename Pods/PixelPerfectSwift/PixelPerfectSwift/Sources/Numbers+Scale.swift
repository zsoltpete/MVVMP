//
//  Numbers+Scale.swift
//  PixelPerfectSwift
//
//  Created by Zsolt Pete on 2018. 12. 22..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

extension CGFloat {
    
    public var pps: CGFloat {
        let sFD = ScaleFactor.shared.scaleFactorDevice
        let currentDeviceWidth = UIScreen.main.nativeBounds.size.width
        let scale = UIScreen.main.scale
        let multiplier = scale / 2
        return currentDeviceWidth / (sFD == .custom ? ScaleFactor.shared.customWidth : sFD.rawValue) * self / multiplier
    }
    
}

extension Float {
    
    public var pps: CGFloat {
        let multiplied = CGFloat(self).pps
        return multiplied
    }
    
}

extension Double {
    
    public var pps: CGFloat {
        let multiplied = CGFloat(self).pps
        return multiplied
    }
    
}

extension NSNumber {
    
    @objc
    public func pps() -> NSNumber {
        let multiplied = Double(self.doubleValue.pps)
        return NSNumber(value: multiplied)
    }
}
