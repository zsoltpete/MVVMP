//
//  CoctailListMAsterViewContract.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

typealias SimpleCompletition = (() -> Void)

protocol CoctailListaMasterViewContract {
    
    func setRandomButtonAction(_ action: SimpleCompletition?)
    func updateList(_ model: [Drink])
    func registerCoctailCell()
    
}
