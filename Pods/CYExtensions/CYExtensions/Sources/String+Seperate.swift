//
//  String+Seperate.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension StringProtocol where Self: RangeReplaceableCollection {
    private mutating func insert(separator: Self, every n: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % n == 0 {
                insert(contentsOf: separator, at: index)
        }
    }
    
    public func inserting(separator: Self, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }
}

extension String {
    
    /// Seperate string with specific character every n space
    ///
    /// - Parameters:
    ///   - every: N number what is will be the count of seperation
    ///   - with: Specific character  what will insert ecery N number
    /// - Returns: modified string.
    public func seperate(every: Int, with: String) -> String {
        var newString = self
        
        newString = newString.replacingOccurrences( of: with, with: "", options: .regularExpression)
        
        newString = newString.inserting(separator: with, every: every)
        return newString
    }
}
