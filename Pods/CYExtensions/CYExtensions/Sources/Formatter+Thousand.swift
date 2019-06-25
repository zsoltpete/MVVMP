//
//  Formatter+Thousand.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 05. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension Formatter {
    
    public static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Double {
    
    /// Create a String from number with thousand seperator with ','
    public var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
