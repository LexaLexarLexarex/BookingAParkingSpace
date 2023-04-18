//
//  BookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IDaddyPresenter {
    func didSelectSpot(with spotId: String)
}

final class DaddyPresenter: IDaddyPresenter {
    weak var view: IBookingView?
    weak var childPresenter2: IBookingPresenter?

    func didSelectSpot(with spotId: String) {
        view?.startConfirmation()
    }
}
