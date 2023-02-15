//
//  UIColor+Hex.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 17.01.2023.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt64, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
