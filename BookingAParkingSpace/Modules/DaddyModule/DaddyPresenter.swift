//
//  BookingPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

protocol IDaddyPresenter {
    func didSelectSpot(with spotId: String, spoteRemoteId: String)
    func didSelectTime(with time: String)
    func didSelectDate(with date: String)
}

final class DaddyPresenter: IDaddyPresenter {
    weak var view: IBookingView?
    weak var childPresenter2: IBookingPresenter?
    private let router: IDaddyRouter

    private var time: String?
    private var date: String?
    private var spotId: String?
    private var spotRemoteId: String?

    init(view: IBookingView? = nil, childPresenter2: IBookingPresenter? = nil, router: IDaddyRouter) {
        self.view = view
        self.childPresenter2 = childPresenter2
        self.router = router
    }

    func didSelectSpot(with spotId: String, spoteRemoteId: String) {
        self.spotId = spotId
        self.spotRemoteId = spoteRemoteId
        startConfirmation()
    }

    func didSelectTime(with time: String) {
        self.time = time
        startConfirmation()
    }

    func didSelectDate(with date: String) {
        self.date = date
        startConfirmation()
    }

    func startConfirmation() {
        guard let time, let date, let spotId, let spotRemoteId else { return }
        router.openConfirmationScreen(with: date, time, spotRemoteId, spotId)
    }
}
