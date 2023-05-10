//
//  ConfirmationAssembly.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import UIKit

class ConfirmationAssembly {
    func assemble(with numberOfSpot: String, _ spotId: String, time: String, date: String, router: IDaddyRouter) -> UIViewController {
        let dateToday = Date()
        let dtf = DateFormatter()
        dtf.dateFormat = "LLLL"
        dtf.locale = Locale(identifier: "ru_RU")
        let month = dtf.string(from: dateToday)
        let presenter = ConfirmationPresenter(
            attributes: [
                numberOfSpot,
                month.capitalized + ", " + date + "\n" + time,
                "ВАЗ 2114\nT251CX",
                date,
                time,
                spotId
            ]
        )

        let view = ConfirmationViewController(presenter: presenter)

        view.router = router
        presenter.view = view

        return view
    }
}
