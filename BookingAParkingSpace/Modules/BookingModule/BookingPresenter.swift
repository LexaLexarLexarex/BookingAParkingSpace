//
//  BookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IBookingPresenter {
    func didSelectSpot(with spotId: String)
}

final class BookingPresenter: IBookingPresenter {
    weak var view: IBookingView?
    weak var childPresenter: IMapPresenter?

    func didSelectSpot(with spotId: String) {
        view?.startConfirmation()
    }
}
