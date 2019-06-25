//
//  BaseViewController.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 01. 10..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import UIKit

public class BaseViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

}

extension BaseViewController: Routable {
    
    public enum StoryboardIdentifier: String {
        case main = "Main"
        case login = "Login"
        case kyc = "KYC"
    }
    
}
