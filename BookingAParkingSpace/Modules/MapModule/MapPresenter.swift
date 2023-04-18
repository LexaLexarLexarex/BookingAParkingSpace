//
//  MapPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import Foundation
import LordOfNetwork

protocol IMapPresenter: AnyObject {
    func getMap()
    func didSelectSpace(at point: CGPoint)
}

final class MapPresenter: IMapPresenter {
    weak var view: IMapView?
    let daddyPresenter: IDaddyPresenter
    private var map: BookingMap?
    private var currentLevel: Level?

    init(view: IMapView? = nil, daddyPresenter: IDaddyPresenter) {
        self.view = view
        self.daddyPresenter = daddyPresenter
    }

    func getMap() {
        DispatchQueue.main.async {
            LON.isLexa.getParkingMap { [weak self] result in
                guard let self else { return }
                switch result {
                case let .success(success):
                    self.map = success
                    guard let level = success.levels.first
                    else {
                        self.view?.showError(NSError(domain: "Ошибка получения уровня", code: 999))
                        return
                    }
                    self.currentLevel = level
                    self.view?.configureMap(with: level)
                case let .failure(failure):
                    self.view?.showError(failure)
                }
            }
        }
    }

    func didSelectSpace(at point: CGPoint) {
        guard let currentLevel else { return }
        view?.configureMap(with: currentLevel)
        var selectedSpot: Spot?
        for spot in currentLevel.spots {
            if point.x > CGFloat(spot.onCanvasCoords.x) &&
                point.x < CGFloat(spot.onCanvasCoords.x + spot.canvas.width) &&
                point.y > CGFloat(spot.onCanvasCoords.y) &&
                point.y < CGFloat(spot.onCanvasCoords.y + spot.canvas.height) {
                selectedSpot = spot
                break
            }
        }
        guard let selectedSpot else { return }

        if selectedSpot.isFree && selectedSpot.isAvailable {
            daddyPresenter.didSelectSpot(with: selectedSpot.parkingNumber)
        }
    }
}
