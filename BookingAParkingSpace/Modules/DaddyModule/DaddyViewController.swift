//
//  BookingViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import Foundation
import UIKit

protocol IBookingView: AnyObject {
    /// Добавляет вид карты
    func addMapView(_ map: UIViewController)
    func addBookingView(_ booking: UIViewController)
    func startConfirmation()
}

final class DaddyViewController: UIViewController {

    let presenter: IDaddyPresenter

    var mapView: UIViewController?

    var bookingView: UIViewController?

    init(presenter: IDaddyPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DaddyViewController: IBookingView {
    func addBookingView(_ booking: UIViewController) {
        add(booking)
        bookingView = booking
        bookingView?.view.snp.makeConstraints {
            guard let mapView else { return }
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(mapView.view.snp.top)
        }
    }

    func addMapView(_ map: UIViewController) {
        add(map)
        mapView = map
        mapView?.view.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height / 4)
        }
    }

    func startConfirmation() {
        print("Начали епта")
    }
}

// MARK: - Жизненный цикл

extension DaddyViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @objc func exit() {
        dismiss(animated: true)
    }
}