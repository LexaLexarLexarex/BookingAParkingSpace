//
//  MapViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import Foundation
import UIKit

protocol IMapView: AnyObject {}

final class MapViewController: UIViewController, IMapView {
    let presenter: IMapPresenter

    init(presenter: IMapPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Жизненный цикл

extension MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }
}
