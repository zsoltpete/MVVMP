//
//  String+Bytes.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 22..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension String {
    
    public func hexStringToBytes() -> [UInt8]? {
        let length = self.count
        if (length & 1) != 0 {
            return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length / 2)
        var index = self.startIndex
        for _ in 0..<length / 2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let b = UInt8(self[index..<nextIndex], radix: 16) {
                bytes.append(b)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }
    
    public func toBytes() -> [UInt8]? {
        return Array(self.utf8)
    }
    
}

extension String: Error {}

extension Collection where Element == UInt8 {
    public var data: Data {
        return Data(self)
    }
    
    public var hexa: String {
        return map { String(format: "%02X", $0) }.joined()
    }
}
