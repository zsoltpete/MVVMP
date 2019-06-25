//
//  StringExtended.swift
//  weedmagnet-ios
//
//  Created by Gabor Eszenyi on 2017. 05. 25..
//  Copyright © 2017. Gábor Eszenyi. All rights reserved.
//

import Foundation

/**
 Helping variables and functions to String.
 */
extension String {
    
    /**
     Create date from a string with a format.
     
     - parameter format: A format, which will use to conver string to a date

     -  returns: nil if formatting is failed, a Date from the String itself
     */
    public func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
    
}

