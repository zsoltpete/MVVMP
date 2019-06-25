//
//  UserDefaultManager.swift
//  test
//
//  Created by Zsolt Pete on 2019. 03. 27..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

struct Defaults {
    
    struct User {
        static let Name = "UserDefault.User.Name"
    }
    
}

// User name methods only for example representing.
/// Use class to save datas to device.
class UserDefaultManager {
    
    static func save(userName: String?) {
        UserDefaults.standard.set(userName, forKey: Defaults.User.Name)
    }
    
    static func loadUserName() -> String? {
        return UserDefaults.standard.object(forKey: Defaults.User.Name) as? String
    }
    
}

extension UserDefaultManager {
    
    func resetDefaults() {
        let dictionary = UserDefaults.standard.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
}
