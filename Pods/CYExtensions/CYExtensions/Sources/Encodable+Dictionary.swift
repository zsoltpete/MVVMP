//
//  Encodable+Dictionary.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension Encodable {
    
    /// Create a dictionary from model. Key is property name, value is property value
    public var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
