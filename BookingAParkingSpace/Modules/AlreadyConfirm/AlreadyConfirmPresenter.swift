import Foundation
import LordOfNetwork

protocol IAlreadyConfirmPresenter: AnyObject {}

final class AlreadyConfirmPresenter: IAlreadyConfirmPresenter {
    weak var view: ITimeSelectionView?

    let model: Reservation
    let time: String
    init(model: Reservation, time: String) {
        self.model = model
        self.time = time
    }
}
