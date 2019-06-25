//
//  AppStoryboard.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 02. 26..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
// swiftlint:disable next force_cast

import Foundation
import UIKit

enum AppStoryboard: String {
    
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(klass: T.Type) -> T {
        let storyboardId = (klass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardId) as! T
    }
    
}

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFromStoryboard(storyboard: AppStoryboard) -> Self {
        return storyboard.viewController(klass: self)
    }
    
}
