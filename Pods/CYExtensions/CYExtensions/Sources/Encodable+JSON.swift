//
//  Encodable+JSON.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 22..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension Encodable {
    
    /// Convert model to String with JSONized format.
    public var convertToString: String? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
