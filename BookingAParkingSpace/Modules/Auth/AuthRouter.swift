//
//  AuthRouter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 06.03.2023.
//

import Foundation
import UIKit

protocol IAuthRouter: AnyObject {
    func openSecondaryScreen()
}

final class AuthRouter: IAuthRouter {

    weak var transitionHandler: UIViewController?

    func openSecondaryScreen() {
        let viewController = BookingAssembly().assemble()
        viewController.modalPresentationStyle = .fullScreen
        transitionHandler?.present(viewController, animated: true)
    }
}
