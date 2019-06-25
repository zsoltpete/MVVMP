//
//  CoctailCell.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class CoctailCell: UITableViewCell {
    
    // MARK: - IBOutlets Constraint
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coctailImageView: UIImageView!
    
    // MARK: - let variables
    
    // MARK: - var variables
    
    // MARK: - LifeCycle methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    func initialize() {
        
    }
    
    func bind(_ model: Drink) {
        self.nameLabel.text = model.strDrink
        if let url = model.strDrinkThumb {
            self.coctailImageView.downloaded(from: url)
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}
