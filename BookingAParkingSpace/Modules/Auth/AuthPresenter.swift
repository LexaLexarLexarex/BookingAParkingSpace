//
//  MainPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 31.01.2023.
//

import Foundation
import LordOfNetwork

protocol IAuthPresenter {
    func didTapEnter(login: String, password: String)
}

final class AuthPresenter: IAuthPresenter {
    let authService: IAuthService & AuthToKeyChain
    private let router: IAuthRouter
    weak var view: IAuthView?

    init(authService: IAuthService & AuthToKeyChain, view: IAuthView? = nil, router: IAuthRouter) {
        self.authService = authService
        self.view = view
        self.router = router
    }

    func didTapEnter(login: String, password: String) {
        let a = AuthModel(login: login, password: password)
        authService.auth(
            with: a,
            completion: { result in
                switch result {
                case .success(let model):
                    self.authService.setAuth(model: a)
                    LON.tokenAccess = model.accessToken
                    self.router.openSecondaryScreen()
                case .failure:
                    self.authService.removeAuth()
                    self.view?.showError("Ничего не работает")
                }
            }
        )
    }
}
