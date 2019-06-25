//
//  CoctailListMasterView.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class CoctailListMasterView: UIView {
    
    var randomButtonAction: SimpleCompletition?
    var tableViewDisposable: Disposable?
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initTableView()
        self.randomButton.addTarget(self, action: #selector(runRandomButtonAction), for: .touchUpInside)
    }
    
    @objc
    func runRandomButtonAction() {
        self.randomButtonAction?()
    }
    
    func initTableView() {
        self.tableView.rowHeight = 44.0
        self.registerCoctailCell()
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
    }
    
}

extension CoctailListMasterView: CoctailListaMasterViewContract {
    
    func setRandomButtonAction(_ action: SimpleCompletition?) {
        self.randomButtonAction = action
    }
    
    func updateList(_ model: [Drink]) {
        tableViewDisposable?.dispose()
        self.tableViewDisposable = Observable.just(model).bind(to: self.tableView.rx.items(cellIdentifier: Cells.CoctailCell)) { (_, model, cell: CoctailCell) in
            cell.bind(model)
        }
    }
    
    func registerCoctailCell() {
        let cellNib = UINib(nibName: Cells.CoctailCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.CoctailCell)
    }
    
}
