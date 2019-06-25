//
//  UISearchBar+Apperance.swift
//  insimu-ios
//
//  Created by Eszenyi Gabor on 2017. 07. 12..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import UIKit

/**
 Helping variables and functions to UISearchBar.
 */
extension UISearchBar {

    /**
     Returns the searchbar UITextfield's element.

     - returns: the searchbar UITextfield's element.
    */
    public func getSearchBarTextField() -> UITextField? {
        
        return getViewElement(type: UITextField.self)
    }

    /**
     Set color to the textfield's text.

     - parameter color: The color of the textfield's text.
     */
    public func setTextColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            textField.textColor = color
        }
    }

    /**
     Set color to the textfield of the UISearchBar.

     - parameter color: The color of the textfield.
     */
    public func setTextFieldColor(color: UIColor) {
        
        if let textField = getViewElement(type: UITextField.self) {
            switch searchBarStyle {
            case .minimal:
                textField.layer.backgroundColor = color.cgColor
                textField.layer.cornerRadius = 6
                
            case .prominent, .default:
                textField.backgroundColor = color
            @unknown default:
                fatalError()
            }
        }
    }

    /**
     Set color to the textfield's placeholder text.

     - parameter color: The color of the textfield's placeholder text.
     */
    public func setPlaceholderTextColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }

    /**
     Set color to the textfield's clear button.

     - parameter color: The color of the textfield's clear button.
     */
    public func setTextFieldClearButtonColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            
            let button = textField.value(forKey: "clearButton") as! UIButton
            if let image = button.imageView?.image {
                button.setImage(image.transform(withNewColor: color), for: .normal)
            }
        }
    }

    /**
     Set image to the search bar.

     - parameter color: Set image to the search bar.
     */
    public func setSearchImageColor(color: UIColor) {
        
        if let imageView = getSearchBarTextField()?.leftView as? UIImageView {
            imageView.image = imageView.image?.transform(withNewColor: color)
        }
    }

    private func getViewElement<T>(type: T.Type) -> T? {

        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
}

