//
//  RealBookingAssembly.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import Foundation

import UIKit

final class BookingAssembly {
    func assemble(daddyPresenter: IDaddyPresenter) -> UIViewController {
        let presenter = BookingPresenter(daddyPresenter: daddyPresenter)
        let dateSelectionPresenter = DateSelectionPresenter(daddyPresenter: daddyPresenter)
        let timeSelectionPresenter = TimeSelectionPresenter(daddyPresenter: daddyPresenter)
        let dateSelectionView = DateSelectionView(presenter: dateSelectionPresenter)
        let timeSelectionView = TimeSelectionViewController(presenter: timeSelectionPresenter)
        let view = BookingModuleController(presenter: presenter, date: dateSelectionView, time: timeSelectionView)

        presenter.view = view

        dateSelectionPresenter.view = dateSelectionView

        view.addDateSelectionView(dateSelectionView)

        timeSelectionPresenter.view = timeSelectionView

        view.addTimeSelectionView(timeSelectionView)

        return view
    }
}
