//
//  UITableView+FakeHeader.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Use to negate table view default 44px header. AddHeader to table view.
    ///
    /// - Parameter height: Height of table view header.
    public func applyFakeHeader(with height: CGFloat = 0.001) {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: height)
        let headerView = UIView(frame: frame)
        self.tableHeaderView = headerView
    }
    
}
