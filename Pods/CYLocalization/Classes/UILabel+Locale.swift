//
//  UILabel+Locale.swift
//  insimu-ios
//
//  Created by Ujlaki Imre on 2017. 07. 03..
//  Copyright © 2017. CodeYard. All rights reserved.
//

import Foundation
import UIKit

class CYTranslatedLabel : UILabel {

    @IBInspectable var translationKey: String = "" {
        didSet {
            self.text = translationKey.localized
        }
    }

}
