//
//  ConfirmationAssembly.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import UIKit

class ConfirmationAssembly {
    func assemble(with numberOfSpot: String, _ spotId: String, time: String) -> UIViewController {
        let presenter = ConfirmationPresenter(attributes: [numberOfSpot, time, "ВАЗ 2114\nT251CX"])

        let view = ConfirmationViewController(presenter: presenter)

        presenter.view = view

        return view
    }
}
