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
    
    private let disposeBag = DisposeBag()
    var viewState = BehaviorRelay<[Drink]>(value: [])
    private var service: DrinkListService
    
    init(service: DrinkListService) {
        self.service = service
    }
    
    func updateViewState(_ model: [Drink]) {
        self.viewState.accept(model)
    }
    
    func fetchLocal() {
        var drinks = [Drink]()
        
        drinks.append(Drink(name: "Metaxa"))
        drinks.append(Drink(name: "Whisky"))
        drinks.append(Drink(name: "Bor"))
        
        self.updateViewState(drinks)
    }
    
    func fetch() {
        self.service.fetchAll().subscribe(onSuccess: { [weak self]drinkResponse in
            self?.updateViewState(drinkResponse.drinks ?? [])
        }).disposed(by: disposeBag)
    }
    
}
