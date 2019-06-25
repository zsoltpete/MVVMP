//
//  Utilities
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

/// Deliver fonts which app can use
class FontDeliver {
 
    static func arial(sizeOf: CGFloat) -> UIFont {
        return UIFont(name: Fonts.Arial.Regular, size: sizeOf) ?? UIFont()
    }
    
}
