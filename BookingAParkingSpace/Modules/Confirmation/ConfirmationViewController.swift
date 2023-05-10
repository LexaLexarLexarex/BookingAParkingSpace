//
//  ConfirmationViewController.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation
import LordOfNetwork
import UIKit

protocol IConfirmationView: AnyObject {
    func configure(with configuration: ConfirmationViewController.Configuration)
    func openAlreadyConfirm(with model: Reservation)
}

// MARK: - ConfirmationViewController

class ConfirmationViewController: UIViewController {
    private let presenter: IConfirmationPresenter

    weak var router: (IDaddyRouter)?
    
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
    func openAlreadyConfirm(with model: Reservation) {
        dismiss(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router?.openAlready(
                reservation: model,
                with: "какой-то фйди",
                self.presenter.getConfirmationData(for: 0),
                time: self.presenter.getConfirmationAttributes(for: 1),
                date: self.presenter.getConfirmationAttributes(for: 1)
            )
        }
    }
    
    func configure(with configuration: Configuration) {}
}

// MARK: - UITableViewDataSource

extension ConfirmationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cellTypeIdentifier")
        

        // Configure the cell’s contents.
        cell.textLabel!.text = presenter.getConfirmationData(for: indexPath.row)
        cell.textLabel?.snp.updateConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(20)
        }
        cell.contentView.snp.makeConstraints{ $0.height.equalTo(self.view.frame.height/5)}
        cell.detailTextLabel?.numberOfLines = 2
        cell.detailTextLabel?.text = presenter.getConfirmationAttributes(for: indexPath.row)

        
        return cell
    }
}

// MARK: - ConfirmationViewController LifeCycle

extension ConfirmationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTypeIdentifier")
        tableView.dataSource = self
        tableView.delegate = self
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
        }
    }
}

// MARK: - Actions

private extension ConfirmationViewController {
    @objc func confirm() {
        presenter.didTapConfirmationButton()
    }
}
