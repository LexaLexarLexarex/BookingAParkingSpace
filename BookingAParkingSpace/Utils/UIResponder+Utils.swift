//
//  UIResponder+Utils.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 31.01.2023.
//
import Foundation
import UIKit
extension UIResponder {
    private enum Static {
        weak static var responder: UIResponder?
    }

    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
