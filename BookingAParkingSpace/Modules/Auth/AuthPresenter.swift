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
    let authService: IAuthTool & AuthToKeyChain
    weak var view: IAuthView?

    init(authService: IAuthTool & AuthToKeyChain, view: IAuthView? = nil) {
        self.authService = authService
        self.view = view
    }

    func didTapEnter(login: String, password: String) {
        let a = AuthModel(login: login, password: password)
        authService.auth(
            with: a,
            completion: { result in
                switch result {
                case let .success(success):
                    self.authService.setAuth(model: a)
                    self.view?.updateUsersInfo(with: success)
                case .failure:
                    self.authService.removeAuth()
                    self.view?.showError("Ничего не работает")
                }
            }
        )
    }
}
