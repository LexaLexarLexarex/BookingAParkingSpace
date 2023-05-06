//
//  BookingRouter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation
import UIKit

protocol IDaddyRouter: AnyObject {
    func openConfirmationScreen(with date: String, _ time: String, _ spotId: String)
}

final class DaddyRouter: IDaddyRouter {

    weak var transitionHandler: UIViewController?

    func openConfirmationScreen(with date: String, _ time: String, _ spotId: String) {
        let viewController = ConfirmationAssembly().assemble()
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        transitionHandler?.present(viewController, animated: true)
    }
}
