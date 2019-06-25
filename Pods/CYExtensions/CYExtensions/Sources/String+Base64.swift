//
//  String+Base64.swift
//  CYExtensions
//
//  Created by Zsolt Pete on 2018. 06. 10..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

/**
 Helping variables and functions to String.
 */
extension String {

    /**
     Decode a string with base64 and create an image.

     - returns: An image if decode is successful.
    */
    public func getImageBase64() -> UIImage? {
        if let dataDecoded: Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            if let image = UIImage(data: dataDecoded) {
                return image
            } else {
                return nil
            }
        } else {
            return nil
        }
    }

}
