//
//  String+Removing.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 04. 06..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension String {
    
    /// Remove all substring from string.
    ///
    /// - Parameter subString: Substring which will be removed.
    /// - Returns: String which not  contains substring.
    public func removeAll(subString: String) -> String {
        let newString = self.replacingOccurrences(of: subString, with: "")
        return newString
    }
    
}
