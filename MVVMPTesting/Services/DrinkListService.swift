//
//  DrinkListService.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class DrinkListService: DataServiceProvider {
    
    func fetchAll() -> Single<DrinkResponse> {
        let endpoint = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        return self.request(endPoint: endpoint, method: .get)
    }
    
}
