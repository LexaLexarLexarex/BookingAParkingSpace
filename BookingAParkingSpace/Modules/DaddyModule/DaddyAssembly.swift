//
//  BookingAssembly.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import UIKit

final class DaddyAssembly {
    func assemble() -> UIViewController {
        let router = DaddyRouter()
        let presenter = DaddyPresenter(router: router)
        let view = DaddyViewController(presenter: presenter)

        presenter.view = view
        router.transitionHandler = view

        let mapPresenter = MapPresenter(daddyPresenter: presenter)
        let mapView = MapViewController(presenter: mapPresenter)

        mapPresenter.view = mapView

        view.addMapView(mapView)

        let viewController = BookingAssembly().assemble(daddyPresenter: presenter)

        view.addBookingView(viewController)

        return view
    }
}
