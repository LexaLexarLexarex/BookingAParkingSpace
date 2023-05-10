import UIKit
import LordOfNetwork

class AlreadyAssembly {
    func assemble(reservation: Reservation, with numberOfSpot: String, _ spotId: String, time: String, date: String) -> UIViewController {
        let presenter = AlreadyConfirmPresenter(model: reservation, time: time)
        let view = AlreadyConfirmViewController(presenter: presenter)


        return view
    }
}
