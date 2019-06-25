//
//  Drink.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation
import ObjectMapper

class Drink: BaseResponse, Encodable {
    
    var strDrinkThumb: String?
    var strDrink: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override init?() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        strDrinkThumb <- map["strDrinkThumb"]
        strDrink <- map["strDrink"]
    }
    
    init(name: String) {
        super.init()!
        self.strDrink = name
        self.strDrinkThumb = "https://www.thecocktaildb.com/images/ingredients/ice-Small.png"
        
    }
    
}
