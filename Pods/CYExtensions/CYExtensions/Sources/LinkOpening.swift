//
//  LinkOpening.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 05. 06..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

public protocol LinkOpening {
    
}

extension LinkOpening {
    
    public func open(link: String) {
        if let url = URL(string: link),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    public func openAppStore(link: String) {
        if let url = URL(string: "itms-apps://" + link),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
