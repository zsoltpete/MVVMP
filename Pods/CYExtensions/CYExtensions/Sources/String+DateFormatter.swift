//
//  String+DateFormatter.swift
//  insimu-ios
//
//  Created by Zsolt Pete on 2017. 11. 22..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import Foundation

/**
 Helping variables and functions to String.
 */
extension String {
    
    /**
     Convert a string with a date formatter to a string from a date formatter
     - parameter formatter: Format of the source string
     - parameter toFormatter: Format of the result string
     - returns: A sting which formatted to the result format
     */
    public func convertWith(from formatter: String, to toFormatter: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let createdDate = dateFormatter.date(from: self) else {
            return ""
        }
        dateFormatter.dateFormat = toFormatter
        return dateFormatter.string(from: createdDate)
    }
    
    /**
     Convert a string with a date formatter to a date
     - parameter formatter: Format of the source string
     - returns: A date which converted the source string and the format
     */
    public func convertToDate(from formatter: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let localDate = dateFormatter.date(from: self)
        return localDate!
    }
    
}
