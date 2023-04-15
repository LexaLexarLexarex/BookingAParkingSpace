//
//  RealBookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 30.03.2023.
//

import Foundation

protocol IRealBookingPresenter: AnyObject {}

final class RealBookingPresenter: IRealBookingPresenter {
    weak var view: IRealBookingView?
    let daddyPresenter: IBookingPresenter
    
    weak var childPresenter: IDateSelectionPresenter?

    init(view: IRealBookingView? = nil, daddyPresenter: IBookingPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
