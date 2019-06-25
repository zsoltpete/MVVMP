//
//  UICollectionView+Direction.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// Set collection view scrolling direction
    ///
    /// - Parameter direction: Direction of the collection view.
    public func setDirection(_ direction: UICollectionView.ScrollDirection) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = direction
        }
    }
    
}
