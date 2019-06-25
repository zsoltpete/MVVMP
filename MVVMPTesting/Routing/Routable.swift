//
//  Routable.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 01. 10..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

public protocol Routable {
    associatedtype StoryboardIdentifier: RawRepresentable
    
    func present<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, animated: Bool, modalPresentationStyle: UIModalPresentationStyle?, configure: ((T) -> Void)?, completion: ((T) -> Void)?)
    func show<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, configure: ((T) -> Void)?)
    func showDetailViewController<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, configure: ((T) -> Void)?)
}

public extension Routable where Self: UIViewController, StoryboardIdentifier.RawValue == String {
    
    /**
     Presents the intial view controller of the specified storyboard modally.
     
     - parameter classType: View controller type.
     - parameter configure: Configure the view controller before it is loaded.
     - parameter completion: Completion the view controller after it is loaded.
     */
    func present<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, animated: Bool, modalPresentationStyle: UIModalPresentationStyle?, configure: ((T) -> Void)?, completion: ((T) -> Void)?) {
        let storyboard = UIStoryboard(name: classType.storyboardName.rawValue)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: classType.storyboardIdentifier) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        if let modalPresentationStyle = modalPresentationStyle {
            controller.modalPresentationStyle = modalPresentationStyle
        }
        
        configure?(controller)
        
        present(controller, animated: animated) {
            completion?(controller)
        }
    }
    
    /**
     Present the intial view controller of the specified storyboard in the primary context.
     Set the initial view controller in the target storyboard or specify the identifier.
     
     - parameter classType: View controller type.
     - parameter configure: Configure the view controller before it is loaded.
     */
    func show<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, configure: ((T) -> Void)?) {
        let storyboard = UIStoryboard(name: classType.storyboardName.rawValue)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: classType.storyboardIdentifier) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        configure?(controller)
        
        show(controller, sender: self)
    }
    
    /**
     Present the intial view controller of the specified storyboard in the secondary (or detail) context.
     Set the initial view controller in the target storyboard or specify the identifier.
     
     - parameter classType: View controller type.
     - parameter configure: Configure the view controller before it is loaded.
     */
    func showDetailViewController<T: BaseViewController, S: RouteIdentifiable>(classType: S.Type, configure: ((T) -> Void)?) {
        let storyboard = UIStoryboard(name: classType.storyboardName.rawValue)
        
    guard let controller = storyboard.instantiateViewController(withIdentifier: classType.storyboardIdentifier) as? T
    else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        configure?(controller)
        
        showDetailViewController(controller, sender: self)
    }
}

public extension UIStoryboard {
    
    /**
     Creates and returns a storyboard object for the specified storyboard resource file in the main bundle of the current application.
     
     - parameter name: The name of the storyboard resource file without the filename extension.
     
     - returns: A storyboard object for the specified file. If no storyboard resource file matching name exists, an exception is thrown.
     */
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
}
