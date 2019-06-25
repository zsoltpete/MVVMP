//
//  Presentable.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol Presentable {
    
    associatedtype ViewState: Any
    
    func handleViewState(_ state: ViewState)
    
}
