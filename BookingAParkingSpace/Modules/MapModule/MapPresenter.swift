//
//  MapPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IMapPresenter: AnyObject {}

final class MapPresenter: IMapPresenter {
    weak var view: IMapView?
    let daddyPresenter: IDaddyPresenter

    init(view: IMapView? = nil, daddyPresenter: IDaddyPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
}
