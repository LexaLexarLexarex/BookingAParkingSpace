//
//  ConfirmationAssembly.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import UIKit

class ConfirmationAssembly {
    func assemble() -> UIViewController {
        let presenter = ConfirmationPresenter()

        let view = ConfirmationViewController(presenter: presenter)

        presenter.view = view

        return view
    }
}
