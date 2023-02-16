//
//  TextField.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 17.01.2023.
//
import UIKit

class TextField: UITextField {
    @IBInspectable var insetX: CGFloat = 22
    @IBInspectable var insetY: CGFloat = 0

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}

extension TextField {
    func initAuthTextField(placeholder: String) {
        backgroundColor = UIColor(hex: 0xF6F7F8)
        layer.cornerRadius = 12
        self.placeholder = placeholder
        layer.masksToBounds = true
        clearButtonMode = .whileEditing
        snp.makeConstraints {
            $0.height.equalTo(56)
        }
    }
}
