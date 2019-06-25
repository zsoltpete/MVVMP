//
//  CoctailListViewModel.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CoctailListViewModel {
    
    var viewState = BehaviorRelay<[Drink]>(value: [])
    
    func updateViewState(_ model: [Drink]) {
        self.viewState.accept(model)
    }
    
    func fetch() {
        var drinks = [Drink]()
        
        drinks.append(Drink(name: "Metaxa"))
        drinks.append(Drink(name: "Whisky"))
        drinks.append(Drink(name: "Bor"))
        
        self.updateViewState(drinks)
    }
    
}
