//
//  BookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IDaddyPresenter {}

final class DaddyPresenter: IDaddyPresenter {
    weak var view: IBookingView?
    weak var childPresenter: IMapPresenter?
    weak var childPresenter2: IBookingPresenter?
}
