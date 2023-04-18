//
//  DateSelectionViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import Foundation
import UIKit

protocol IDateSelectionView: AnyObject {}

class DateSelectionView: UIViewController, IDateSelectionView {

    let presenter: IDateSelectionPresenter

    private let dataDate: [String] = {
        var dataDate: [String] = []
        let date = Date()
        let calendar = Calendar.current

        guard let interval = calendar.dateInterval(of: .month, for: date) else { return [] }
        guard let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day else { return [] }

        let today = calendar.component(.day, from: date)

        for day in today ... days {
            dataDate.append("\(day)")
        }
        return dataDate
    }()

    fileprivate let collectionViewDate: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.contentInset = UIEdgeInsets(top: .zero, left: 15, bottom: .zero, right: 15)
        return cv
    }()

    init(presenter: IDateSelectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DateSelectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataDate.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let greyColor = UIColor(hex: 0xF6F7F8)
        guard let cell = collectionViewDate.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
        else { return UICollectionViewCell() }
        cell.backgroundColor = greyColor
        cell.data = dataDate[indexPath.row]
        cell.layer.cornerRadius = 12
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 50, height: 50)
    }
}

extension DateSelectionView {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionViewDate)
        collectionViewDate.backgroundColor = .white
        collectionViewDate.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        collectionViewDate.allowsMultipleSelection = false
        collectionViewDate.showsHorizontalScrollIndicator = false

        collectionViewDate.delegate = self
        collectionViewDate.dataSource = self
    }

    @objc func exit() {
        dismiss(animated: true)
    }
}

class CustomCell: UICollectionViewCell {

    var data: String? {
        didSet {
            guard let data = data else { return }
            bg.text = data
        }
    }

    fileprivate let bg: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.textAlignment = .center
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    override var isSelected: Bool {
        didSet {
            let yellowColor = UIColor(hex: 0xFFDD2D)
            let greyColor = UIColor(hex: 0xF6F7F8)
            backgroundColor = isSelected ? yellowColor : greyColor
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
