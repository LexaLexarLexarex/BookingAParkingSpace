//
//  BookingRouter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation
import UIKit
import LordOfNetwork

protocol IDaddyRouter: AnyObject {
    func openConfirmationScreen(with date: String, _ time: String, _ spotId: String, _ numberOfSpot: String)
    func openAlready(reservation: Reservation, with boobs: String, _ id: String, time: String, date: String)
}

final class DaddyRouter: IDaddyRouter {

    weak var transitionHandler: UIViewController?

    func openConfirmationScreen(with date: String, _ time: String, _ spotId: String, _ numberOfSpot: String) {
        let viewController = ConfirmationAssembly().assemble(with: numberOfSpot, spotId, time: time, date: date, router: self)
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        transitionHandler?.present(viewController, animated: true)
    }


    func openAlready(reservation: Reservation, with boobs: String, _ id: String, time: String, date: String){
        let viewController = AlreadyAssembly().assemble(reservation: reservation, with: boobs, id, time: time, date: date)
//        if let sheet = viewController.sheetPresentationController {
//            sheet.detents = [.medium()]
//        }
        //transitionHandler?.present(viewController, animated: true)
        transitionHandler?.add(viewController)
        
        viewController.view.layer.shadowOpacity = 0.3
        viewController.view.layer.shadowColor = UIColor.black.cgColor
        viewController.view.layer.shadowRadius = 50
        viewController.view.layer.cornerRadius = 16
        
        viewController.view.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(270)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
}
