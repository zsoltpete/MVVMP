//
//  UISearchBar+ToolBar.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2018. 06. 10..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

/**
 Helping variables and functions to UISearchBar.
 */
extension UISearchBar {

    /**
     Add toolBar to the top with a button.

     - parameter title: Title of the tool bar.
     - parameter color: Color of the tool bar button.
    */
    public func addToolBar(with title: String = "Done", color: UIColor = .black) {

        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(doneButtonAction))
        doneBtn.tintColor = color
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar

    }

    @objc
    private func doneButtonAction() {

        self.endEditing(true)

    }

}
