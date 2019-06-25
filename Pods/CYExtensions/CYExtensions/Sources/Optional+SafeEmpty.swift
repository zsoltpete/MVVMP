//
//  Array+Sample.swift
//  insimu-ios
//
//  Created by Ujlaki Imre on 2017. 08. 31..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import Foundation

/**
 Helping variables and functions to Optional.
 */
extension Optional where Wrapped == String {
    
    /// Return value if value is nil the returns "" [empty string]
    public var safeEmpty: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Double {
    
    /// Return value if value is nil the returns 0
    public var safeEmpty: Double {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Int {
    
    /// Return value if value is nil the returns 0
    public var safeEmpty: Int {
        return self ?? 0
    }
}

extension Optional where Wrapped == CGFloat {
    
    /// Return value if value is nil the returns 0
    public var safeEmpty: CGFloat {
        return self ?? 0.0
    }
}
