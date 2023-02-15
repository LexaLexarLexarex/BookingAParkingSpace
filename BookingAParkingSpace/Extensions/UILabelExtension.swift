//
//  UILabelExtension.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 17.01.2023.
//
import UIKit

extension UILabel{
    func initLabel(text: String, fontSize: CGFloat){
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textAlignment = .center
        self.snp.makeConstraints{
            $0.width.equalTo(350)
        }
    }
}
