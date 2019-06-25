//
//  UIWindow+SafeArea.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UIWindow {
    
    /// Bottom safe area of a device.
    ///
    /// - Returns: Value of safe area.
    public static func safeAreaBottom() -> CGFloat {
        var safeAreaBottom: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let window: UIWindow? = UIApplication.shared.keyWindow
            safeAreaBottom = window?.safeAreaInsets.bottom ?? 0.0
        }
        return safeAreaBottom
    }
    
    /// Top safe area of a device.
    ///
    /// - Returns: Value of safe area.
    public static func safeAreaTop() -> CGFloat {
        var safeAreaTop: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let window: UIWindow? = UIApplication.shared.keyWindow
            safeAreaTop = window?.safeAreaInsets.top ?? 0.0
        }
        return safeAreaTop
    }
    
}
