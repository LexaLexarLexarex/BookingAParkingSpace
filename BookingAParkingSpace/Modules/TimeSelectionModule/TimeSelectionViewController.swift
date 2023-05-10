//
//  TimeSelectionViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import UIKit

protocol ITimeSelectionView: AnyObject {}

class TimeSelectionViewController: UIViewController, ITimeSelectionView {

    let presenter: ITimeSelectionPresenter

    let dataTime = [
        "09:00 - 18:00",
        "10:00 - 19:00",
        "11:00 - 20:00",
        "12:00 - 21:00",
        "13:00 - 22:00",
        "14:00 - 23:00",
        "15:00 - 00:00",
        "16:00 - 01:00",
        "17:00 - 02:00",
        "18:00 - 03:00",
        "19:00 - 04:00",
        "20:00 - 05:00",
        "21:00 - 06:00",
        "22:00 - 07:00",
        "23:00 - 08:00",
        "00:00 - 09:00",
        "01:00 - 10:00",
        "02:00 - 11:00",
        "03:00 - 12:00",
        "04:00 - 13:00",
        "05:00 - 14:00",
        "06:00 - 15:00",
        "07:00 - 16:00",
        "09:00 - 17:00",
    ]

    fileprivate let collectionViewTime: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.contentInset = UIEdgeInsets(top: .zero, left: 15, bottom: .zero, right: 15)
        return cv
    }()

    init(presenter: ITimeSelectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TimeSelectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataTime.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let greyColor = UIColor(hex: 0xF6F7F8)
        guard let cell = collectionViewTime.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
        else { return UICollectionViewCell() }
        cell.backgroundColor = greyColor
        cell.data = dataTime[indexPath.row]
        cell.doSelect = {
            self.presenter.didSelectTime(with: cell.data ?? "")
        }
        cell.layer.cornerRadius = 12
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 150, height: 50)
    }
}

// MARK: - Жизненный цикл

extension TimeSelectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionViewTime)
        collectionViewTime.backgroundColor = .white
        collectionViewTime.snp.makeConstraints { $0.directionalEdges.equalToSuperview() }
        collectionViewTime.allowsMultipleSelection = false
        collectionViewTime.showsHorizontalScrollIndicator = false

        collectionViewTime.delegate = self
        collectionViewTime.dataSource = self
    }

    @objc func exit() {
        dismiss(animated: true)
    }
}
