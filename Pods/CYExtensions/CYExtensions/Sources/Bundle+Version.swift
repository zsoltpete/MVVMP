//
//  Bundle+Version.swift
//  insimu-ios
//
//  Created by Zsolt Pete on 2017. 11. 30..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import Foundation

/**
 *  Extensions to get helping variables and functions. 
 */
extension Bundle {

    /**
     The project release version number in String value.
     */
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /**
     The project build version number in String value.
     */
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
