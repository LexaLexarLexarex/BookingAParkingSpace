//
//  MainAssembly.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 31.01.2023.
//

import Foundation
import LordOfNetwork
import UIKit

final class AuthAssembly {
    func assemble() -> UIViewController {
        let router = AuthRouter()
        let presenter = AuthPresenter(
            authService: LON.isLexa,
            router: router
        )

        let controller = AuthViewController(presenter: presenter)

        presenter.view = controller
        router.transitionHandler = controller

        if let log = LON.isLexa.oldAuth() {
            presenter.didTapEnter(
                login: log.login,
                password: log.password
            )
        }
        return controller
    }
}
