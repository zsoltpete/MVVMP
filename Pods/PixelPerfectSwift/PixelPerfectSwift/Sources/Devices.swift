//
//  Devices.swift
//  PixelPerfectSwift
//
//  Created by Zsolt Pete on 2018. 12. 22..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

public enum Device: CGFloat {
    case IPad129 = 2048
    case IPad11 = 1668.1
    case IPad105 = 1668
    /**
     iPad 3, iPad 4, iPad Air, iPad Air 2, 9.7-inch iPad Pro, iPad Mini 2, iPad Mini 3, iPad Mini 4
     */
    case IPadAir = 1536
    
    /**
     iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
     One dimension is for the simulator and the other for the actual device.
     */
    case iPhone8PlusSimulator = 1242.1
    case iPhone8Plus = 1080
    /**
     iPhone 5S, iPhone 5
     */
    case iPhoneSE = 640
    /**
     iPhone 6, iPhone 6S, iPhone 7, iPhone 8,
     */
    case iPhone8 = 750
    /**
     iPhone Xs, iPhone X
     */
    case iPhoneXs = 1125
    /**
     iPhone XR and iPhone XS Max
     */
    case iPhoneXr = 828
    case iPhoneXsMax = 1242
    
    /**
     Use to set custom device if for example, design not compatible with iPhone devices.
     */
    case custom
}
