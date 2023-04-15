//
//  BookingAssembly.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import UIKit

final class BookingAssembly {
    func assemble() -> UIViewController {
        let presenter = BookingPresenter()
        let view = BookingViewController(presenter: presenter)

        presenter.view = view

        let mapPresenter = MapPresenter(daddyPresenter: presenter)
        let mapView = MapViewController(presenter: mapPresenter)
        
        mapPresenter.view = mapView
        
        view.addMapView(mapView)

        let viewController = RealBookingAssembly().assemble(daddyPresenter: presenter)
        
        view.addBookingView(viewController)
        
        return view
    }
}
