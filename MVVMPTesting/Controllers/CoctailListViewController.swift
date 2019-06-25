//
//  CoctailListViewController.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class CoctailListViewController: UIViewController {

    @IBOutlet var masterView: CoctailListMasterView!
    
    var presenter: CoctailListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = CoctailListViewModel()
        presenter = CoctailListPresenter(view: self.masterView, viewModel: viewModel)
    }

}
