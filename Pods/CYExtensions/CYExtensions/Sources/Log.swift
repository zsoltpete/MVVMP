//
//  Log.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 28..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

public class Log {
    
    public static func info(_ text: Any) {
        print("🐇ℹ️ \(text)")
    }
    
    public static func success(_ text: Any) {
        print("🦖✅ \(text)")
    }
    
    public static func error(_ text: Any) {
        print("🦀❗ \(text)")
    }
    
    public static func warning(_ text: Any) {
        print("🙈🙉🙊⚠️ \(text)")
    }
    
    public static func network(_ text: Any) {
        print("🦅📨 \(text)")
    }
    
    public static func database(_ text: Any) {
        print("🐺🗄️ \(text)")
    }
    
}
