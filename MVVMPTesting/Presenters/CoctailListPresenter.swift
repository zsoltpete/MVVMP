//
//  CoctailListPresenter.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CoctailListPresenter: BasePresenter {
    
    let disposeBag = DisposeBag()
    
    private var view: CoctailListaMasterViewContract
    private var viewModel: CoctailListViewModel
    
    init(view: CoctailListaMasterViewContract, viewModel: CoctailListViewModel) {
        self.viewModel = viewModel
        self.view = view
        super.init()
        self.addRandomButtonAction()
        self.initSubscriptions()
    }
    
    func initSubscriptions() {
        self.viewModel.viewState.subscribe(onNext: { [weak self]value in
            self?.handleViewState(value)
        }).disposed(by: disposeBag)
    }
    
    func addRandomButtonAction() {
        self.view.setRandomButtonAction { [weak self] in
            self?.viewModel.fetch()
        }
    }
}

extension CoctailListPresenter: Presentable {
    
    func handleViewState(_ state: [Drink]) {
        self.view.updateList(state)
    }
}
