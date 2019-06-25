//
//  Theme
//  ChuckNorrisFacts
//
//  Created by Zsolt Pete on 2019. 05. 12..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
// swiftlint:disable disable_uicolor

import UIKit

protocol MixedColorable {
    
    var light: UIColor { get set }
    var dark: UIColor { get set }
    
}

class MixedColor: MixedColorable {
    
    var light: UIColor = .white
    var dark: UIColor = .black
    
    init(light: UIColor = .white, dark: UIColor = .black) {
        self.light = light
        self.dark = dark
    }
    
}
