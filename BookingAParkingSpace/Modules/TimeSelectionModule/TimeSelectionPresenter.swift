//
//  TimeSelectionPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 13.04.2023.
//

import Foundation

protocol ITimeSelectionPresenter: AnyObject {}

final class TimeSelectionPresenter: ITimeSelectionPresenter {
    weak var view: ITimeSelectionView?
    let daddyPresenter: IBookingPresenter

    init(view: ITimeSelectionView? = nil, daddyPresenter: IBookingPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
