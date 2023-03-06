//
//  MapPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IMapPresenter: AnyObject {}

final class MapPresenter: IMapPresenter {
    weak var view: IMapView?
    let daddyPresenter: IBookingPresenter

    init(view: IMapView? = nil, daddyPresenter: IBookingPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
