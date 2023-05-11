//
//  TimeSelectionPresenter.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 13.04.2023.
//

import Foundation

protocol ITimeSelectionPresenter: AnyObject {
    func didSelectTime(with time: String)
}

final class TimeSelectionPresenter: ITimeSelectionPresenter {
    weak var view: ITimeSelectionView?
    let daddyPresenter: IDaddyPresenter

    init(view: ITimeSelectionView? = nil, daddyPresenter: IDaddyPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }
    
    func didSelectTime(with time: String) {
        daddyPresenter.didSelectTime(with: time)
    }
}
