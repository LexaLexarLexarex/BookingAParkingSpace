//
//  RealBookingViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 30.03.2023.
//

import UIKit

protocol IRealBookingView: AnyObject {
    func addDateSelectionView(_ date: UIViewController)
    func addTimeSelectionView(_ time: UIViewController)
}

class BookingModuleController: UIViewController, IRealBookingView {

    let presenter: IBookingPresenter

    var date: UIViewController?

    var time: UIViewController?

    private lazy var rootStackView = UIStackView(arrangedSubviews: [date!.view, time!.view])

    init(presenter: IBookingPresenter, date: UIViewController, time: UIViewController) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.date = date
        self.time = time
        setUp()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookingModuleController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func setUp() {
        view.addSubview(rootStackView)
        rootStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        rootStackView.axis = .vertical
    }
}

extension BookingModuleController {
    func addDateSelectionView(_ date: UIViewController) {
        date.view.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }
    }

    func addTimeSelectionView(_ time: UIViewController) {
        time.view.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(date!.view.snp.bottom)
        }
    }
}
