//
//  ConfirmationPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation

protocol IConfirmationPresenter {
    func didTapConfirmationButton()
}

class ConfirmationPresenter {
    weak var view: IConfirmationView?
}

extension ConfirmationPresenter: IConfirmationPresenter {
    func didTapConfirmationButton() {
        print("didTapConfirmationButton")
    }
}
