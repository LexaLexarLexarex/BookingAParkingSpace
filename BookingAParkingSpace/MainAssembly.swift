//
//  MainAssembly.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 31.01.2023.
//

import Foundation
import UIKit

final class MainAssembly {
    
    func assemble() -> UIViewController {
//        let router = MainRouter()
        let presenter = MainPresenter()
        let controller = MainViewController(presenter: presenter)
        presenter.view = controller
//        router.transitionHandler = controller
        return controller
    }
}
