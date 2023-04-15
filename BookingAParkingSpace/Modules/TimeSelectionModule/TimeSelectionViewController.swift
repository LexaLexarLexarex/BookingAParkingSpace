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

    let dataTime = ["09:00 - 18:00", "10:00 - 19:00", "11:00 - 20:00",
                "12:00 - 21:00", "13:00 - 22:00", "14:00 - 23:00",
                "15:00 - 00:00", "16:00 - 01:00", "17:00 - 02:00",
                "18:00 - 03:00", "19:00 - 04:00", "20:00 - 05:00",
                "21:00 - 06:00", "22:00 - 07:00", "23:00 - 08:00",
                "00:00 - 09:00", "01:00 - 10:00", "02:00 - 11:00",
                "03:00 - 12:00", "04:00 - 13:00", "05:00 - 14:00",
                "06:00 - 15:00", "07:00 - 16:00", "09:00 - 17:00"
    ]
    
    fileprivate let collectionViewTime: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    init(presenter: ITimeSelectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension TimeSelectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataTime.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let greyColor = UIColor(hex: 0xF6F7F8)
        let cell = collectionViewTime.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = greyColor
        cell.data = self.dataTime[indexPath.row]
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
}

// MARK: - Жизненный цикл

extension TimeSelectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionViewTime)
        collectionViewTime.backgroundColor = .white
        collectionViewTime.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionViewTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6).isActive = true
        collectionViewTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6).isActive = true
        collectionViewTime.heightAnchor.constraint(equalTo: collectionViewTime.widthAnchor, multiplier: 0.2).isActive = true
        collectionViewTime.allowsMultipleSelection = false
        collectionViewTime.showsHorizontalScrollIndicator = false
        
        collectionViewTime.delegate = self
        collectionViewTime.dataSource = self
    }

    @objc func exit() {
        dismiss(animated: true)
    }
}
