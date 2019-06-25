//
//  RouteIdentifiable.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 01. 12..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

public protocol RouteIdentifiable: class {
    
    static var storyboardIdentifier: String { get }
    static var storyboardName: BaseViewController.StoryboardIdentifier { get }
    
}

public extension RouteIdentifiable where Self: BaseViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
}
