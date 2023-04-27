//
//  ConfirmationViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation
import UIKit

protocol IConfirmationView: AnyObject {
    func configure(with configuration: ConfirmationViewController.Configuration)
}

// MARK: - ConfirmationViewController

class ConfirmationViewController: UIViewController {
    private let presenter: IConfirmationPresenter

    private var contentStackView: UIStackView = {
        let stack = UIStackView()

        stack.axis = .vertical
        stack.alignment = .center

        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.initLabel(text: "Бронирование", fontSize: 28)
        label.textAlignment = .left

        return label
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton()

        button.setTitle("Забронировать", for: .normal)
        button.setTitleColor(.some(.black), for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.867, blue: 0.176, alpha: 1)
        button.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        button.layer.cornerRadius = 12

        return button
    }()

    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)

        return table
    }()

    init(presenter: IConfirmationPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ConfirmationViewController.Configuration

extension ConfirmationViewController {
    struct Configuration {
        let place: String
        let date: String
        let time: String
        let carNumber: String
        let carModel: String
    }
}

// MARK: - IConfirmationView

extension ConfirmationViewController: IConfirmationView {
    func configure(with configuration: Configuration) {}
}

// MARK: - UITableViewDataSource

extension ConfirmationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath)

        // Configure the cell’s contents.
        cell.textLabel!.text = "Cell text"

        return cell
    }
}

// MARK: - ConfirmationViewController LifeCycle

extension ConfirmationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.dataSource = self
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(tableView)
        contentStackView.addArrangedSubview(confirmButton)
        setUp()
    }
}

// MARK: - ConfirmationViewController UI

private extension ConfirmationViewController {
    func setUp() {
        contentStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        confirmButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(56)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(20)
            $0.height.equalTo(33)
        }
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.bottom.equalTo(confirmButton.snp.top)
        }
    }
}

// MARK: - Actions

private extension ConfirmationViewController {
    @objc func confirm() {
        presenter.didTapConfirmationButton()
    }
}
