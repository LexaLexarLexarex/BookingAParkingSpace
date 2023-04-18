//
//  RealBookingViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 30.03.2023.
//

import Foundation
import UIKit

protocol IRealBookingView: AnyObject {
    func addDateSelectionView(_ date: UIViewController)
    func addTimeSelectionView(_ time: UIViewController)
}

// MARK: - BookingModuleController

class BookingModuleController: UIViewController {

    let presenter: IBookingPresenter

    var currentMonth: UILabel = {
        let date = Date()
        let dtf = DateFormatter()
        dtf.dateFormat = "LLLL"
        var month = dtf.string(from: date)

        let label = UILabel()
        label.text = month.capitalized
        label.textAlignment = .left
        label.textColor = .black

        return label
    }()

    var date: UIViewController?

    var time: UIViewController?

    private lazy var rootStackView = UIStackView(arrangedSubviews: [currentMonth, date!.view, time!.view, UIView()])

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

        currentMonth.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(20)
        }
    }
}

// MARK: - IRealBookingView

extension BookingModuleController: IRealBookingView {

    func addDateSelectionView(_ date: UIViewController) {
        date.view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(currentMonth.snp.bottom)
            $0.bottom.equalTo(rootStackView.snp.centerY).inset(5)
        }
    }

    func addTimeSelectionView(_ time: UIViewController) {
        time.view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(date!.view.snp.bottom)
        }
        rootStackView.arrangedSubviews.last?.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}
