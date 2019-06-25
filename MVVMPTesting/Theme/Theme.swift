//
//  Theme
//  ChuckNorrisFacts
//
//  Created by Zsolt Pete on 2019. 05. 12..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
// swiftlint:disable disable_uicolor

import Foundation
import RxSwift
import RxTheme
import UIKit

protocol Theme {
    var backgroundColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = Colors.BackGroundColor.light
    let primaryTextColor = Colors.PrimaryTextColor.light
    let secondaryTextColor = Colors.SecondaryTextColor.light
}

struct DarkTheme: Theme {
    let backgroundColor = Colors.BackGroundColor.dark
    let primaryTextColor = Colors.PrimaryTextColor.dark
    let secondaryTextColor = Colors.SecondaryTextColor.dark
}

enum ThemeType: ThemeProvider {
    case light, dark
    
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

func themed<T>(_ mapper: @escaping ((Theme) -> T)) -> Observable<T> {
    return AppDelegate.shared.themeService.attrStream(mapper)
}
