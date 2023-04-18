//
//  RealBookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 30.03.2023.
//

import Foundation

protocol IBookingPresenter: AnyObject {}

final class BookingPresenter: IBookingPresenter {
    weak var view: IRealBookingView?
    let daddyPresenter: IDaddyPresenter

    weak var childPresenter: IDateSelectionPresenter?

    init(view: IRealBookingView? = nil, daddyPresenter: IDaddyPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
