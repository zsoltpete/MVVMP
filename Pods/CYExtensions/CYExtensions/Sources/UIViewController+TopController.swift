//
//  UIViewController+TopController.swift
//  weedmagnet-ios
//
//  Created by Zsolt Pete on 2017. 08. 07..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UIViewController.
 */
extension UIViewController{
    
    /**
     Returns the top controller of the screen.
     
     - returns: nil if no controller on the screen, else the top controller of the screen
     */
    public func getTopController() -> UIViewController?{
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
