//
//  DateSelectionPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import Foundation

protocol IDateSelectionPresenter: AnyObject {}

final class DateSelectionPresenter: IDateSelectionPresenter {
    weak var view: IDateSelectionView?
    let daddyPresenter: IBookingPresenter

    init(view: IDateSelectionView? = nil, daddyPresenter: IBookingPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
