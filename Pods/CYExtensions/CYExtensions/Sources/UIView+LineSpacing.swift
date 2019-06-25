//
//  UIView+LineSpacing.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2019. 03. 23..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UILabel {
    public func setLineSpacing(to value: CGFloat, letterSpace kernValue: CGFloat = 0.0) {
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = value / self.font.pointSize
            text.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.length))
            if kernValue != 0.0 {
                text.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: text.length - 1))
            }
            self.attributedText = text
        }
    }
    
    public func setLetterSpace(kernValue: CGFloat = 0.0) {
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            if kernValue != 0.0 {
                text.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: text.length - 1))
            }
            self.attributedText = text
        }
    }
    
    //Use in 3.0
    public  func setLabelLineSpacing(to value: CGFloat, letterSpace kernValue: CGFloat = 0.0) {
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            text.setLineSpacing(to: value, letterSpace: kernValue)
            self.attributedText = text
        }
    }
}

extension UITextView {
    public func setLineSpacing(to value: CGFloat, letterSpace kernValue: CGFloat = 0.0) {
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            text.setLineSpacing(to: value, letterSpace: kernValue)
            self.attributedText = text
        }
    }
    
    public func setLetterSpace(kernValue: CGFloat = 0.0) {
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            if kernValue != 0.0 {
                text.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: text.length - 1))
            }
            self.attributedText = text
        }
    }
}

extension NSMutableAttributedString {
    public func setLineSpacing(to value: CGFloat, letterSpace kernValue: CGFloat = 0.0) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = value
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.length))
        if kernValue != 0.0 {
            self.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: self.length - 1))
        }
    }
}

extension UITextField {
    public func setLetterSpace(kernValue: CGFloat = 0.0) {
        if let labelText = self.text, !labelText.isEmpty {
            let text = NSMutableAttributedString(string: labelText)
            if kernValue != 0.0 {
                text.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: text.length - 1))
            }
            self.attributedText = text
        }
    }
}

