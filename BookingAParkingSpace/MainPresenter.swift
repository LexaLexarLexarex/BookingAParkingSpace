//
//  MainPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 31.01.2023.
//

import Foundation

protocol IMainPresenter {
    func didTapEnter(login: String, password: String)
}

final class MainPresenter: IMainPresenter {
    
    var view: IMainView?
    
    func didTapEnter(login: String, password: String) {
        print(login)
        print(password)
    }
    
    
}

