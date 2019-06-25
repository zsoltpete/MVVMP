//
//  Int+Timestamp.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 04. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension Double {
    
    /// Create a String from timestamp with format.
    ///
    /// - Parameter format: Date format.
    /// - Returns: String value from timestamp.
    public func toDateString(format: String) -> String {
        let date = Date(milliseconds: self)
        let dateFormatter = DateFormatter()
        let timeZone = TimeZone.current.identifier 
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

extension Date {
    
    public var millisecondsSince1970: Double {
        return Double((self.timeIntervalSince1970 * 1_000.0).rounded())
    }
    
    public init(milliseconds: Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1_000)
    }
}
