//
//  RealBookingAssembly.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import Foundation

import UIKit

final class RealBookingAssembly {
    func assemble(daddyPresenter: IBookingPresenter) -> UIViewController {
        let presenter = RealBookingPresenter( daddyPresenter: daddyPresenter)
        let dateSelectionPresenter = DateSelectionPresenter(daddyPresenter: presenter)
        let timeSelectionPresenter = TimeSelectionPresenter(daddyPresenter: presenter)
        let dateSelectionView = DateSelectionView(presenter: dateSelectionPresenter)
        let timeSelectionView = TimeSelectionViewController(presenter: timeSelectionPresenter)
        let view = RealBookingViewController(presenter: presenter, date: dateSelectionView, time: timeSelectionView)

        presenter.view = view

        dateSelectionPresenter.view = dateSelectionView
        
        view.addDateSelectionView(dateSelectionView)

        timeSelectionPresenter.view = timeSelectionView
        
        view.addTimeSelectionView(timeSelectionView)

        return view
    }
}
