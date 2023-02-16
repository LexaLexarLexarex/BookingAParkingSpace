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
//        let router = MainRouter()
        let presenter = AuthPresenter(authService: LON.isLexa)

        let controller = AuthViewController(presenter: presenter)
        presenter.view = controller
        if let log = LON.isLexa.oldAuth() {
            presenter.didTapEnter(
                login: log.login,
                password: log.password
            )
        }
//        router.transitionHandler = controller
        return controller
    }
}
