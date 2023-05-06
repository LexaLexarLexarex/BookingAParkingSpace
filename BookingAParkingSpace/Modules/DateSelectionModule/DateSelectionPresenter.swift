//
//  DateSelectionPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import Foundation

protocol IDateSelectionPresenter: AnyObject {
    func didSelectDate(_ date: String)
}

final class DateSelectionPresenter: IDateSelectionPresenter {
    weak var view: IDateSelectionView?
    let daddyPresenter: IDaddyPresenter

    init(view: IDateSelectionView? = nil, daddyPresenter: IDaddyPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }

    func didSelectDate(_ date: String) {
        daddyPresenter.didSelectDate(with: date)
    }
}
