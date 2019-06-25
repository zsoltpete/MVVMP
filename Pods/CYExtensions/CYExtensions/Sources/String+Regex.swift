//
//  String+Regex.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
// swiftlint:disable force_unwrapping
// swiftlint:disable force_try

import Foundation

extension String {
    
    public func matches(for regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    public func matchesRegex(_ regex: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: regex, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    public func matches(_ regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
