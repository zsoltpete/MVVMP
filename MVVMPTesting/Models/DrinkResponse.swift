//
//  DrinkResponse.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import ObjectMapper

class DrinkResponse: BaseResponse, Encodable {
    
    var drinks: [Drink]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override init?() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        drinks <- map["drinks"]
    }
    
}
