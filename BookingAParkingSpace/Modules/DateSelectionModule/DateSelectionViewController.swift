//
//  DateSelectionViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 05.04.2023.
//

import UIKit

protocol IDateSelectionView: AnyObject {}

class DateSelectionView: UIViewController, IDateSelectionView{

    let presenter: IDateSelectionPresenter
    
    let dataDate = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"
    ]
    
    fileprivate let collectionViewDate: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    init(presenter: IDateSelectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DateSelectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataDate.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let greyColor = UIColor(hex: 0xF6F7F8)
        let cell = collectionViewDate.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = greyColor
        cell.data = self.dataDate[indexPath.row]
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension DateSelectionView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionViewDate)
        collectionViewDate.backgroundColor = .white
        collectionViewDate.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        collectionViewDate.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 6).isActive = true
        collectionViewDate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -6).isActive = true
        collectionViewDate.heightAnchor.constraint(equalTo: collectionViewDate.widthAnchor, multiplier: 0.2).isActive = true
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
            guard let data = data else {return}
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

        self.contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    override var isSelected: Bool {
        didSet {
            let yellowColor = UIColor(hex: 0xFFDD2D)
            let greyColor = UIColor(hex: 0xF6F7F8)
            self.backgroundColor = self.isSelected ? yellowColor : greyColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
