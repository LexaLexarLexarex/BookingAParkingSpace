//
//  BookingViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 21.02.2023.
//

import Foundation
import UIKit

protocol IBookingView: AnyObject {
    func addMapView(_ map: UIViewController)
    func startConfirmation()
}

final class BookingViewController: UIViewController {

    let presenter: IBookingPresenter
    let timeExitButton = UIButton(frame: .zero)

    init(presenter: IBookingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookingViewController: IBookingView {
    func startConfirmation() {
//        let confirmation = UIViewController()
//        confirmation.view.backgroundColor = .white
//        present(confirmation, animated: true)
    }

    func addMapView(_ map: UIViewController) {
        add(map)
        map.view.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height / 4)
        }
    }
}

// MARK: - Жизненный цикл

extension BookingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        timeExitButton.backgroundColor = .darkGray
        timeExitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)

        view.backgroundColor = .blue
        addViews()
        setupLayout()
    }

    func addViews() {
        view.addSubview(timeExitButton)
    }

    func setupLayout() {
        timeExitButton.snp.makeConstraints {
            $0.size.equalTo(80)
            $0.leading.top.equalTo(100)
        }
    }

    @objc func exit() {
        dismiss(animated: true)
    }
}
