//
//  ViewController.swift
//  BookingAParkingSpace
//
//  Created by lexar on 22.11.2022.
//

import UIKit
import SnapKit
import LordOfNetwork

class ViewController: UIViewController {

    private lazy var enterButton = UIButton()
    private lazy var label1 = UILabel()
    private lazy var label2 = UILabel()
    private lazy var imageView = UIImageView()
    private lazy var image = UIImage(named: "Logo")
    private lazy var login = UITextField()
    private lazy var password = UITextField()
    private var constraint: Constraint?
    
    private lazy var labelsStackView = UIStackView(arrangedSubviews: [label1, label2])
    private lazy var rootStackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, signUpStackView])
    private lazy var signUpStackView = UIStackView(arrangedSubviews: [login, password, enterButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func setUpRootStackView(){
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.setCustomSpacing(24, after: imageView)
        rootStackView.setCustomSpacing(64, after: labelsStackView)
        view.addSubview(rootStackView)
        rootStackView.snp.makeConstraints {
            constraint = $0.centerY.equalToSuperview().constraint
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setUpSignUpStackView() {
        login.backgroundColor = UIColor(hex: 0xF6F7F8)
        login.layer.cornerRadius = 12
        login.placeholder = "Имя пользователя"
        login.layer.masksToBounds = true
        login.clearButtonMode = .whileEditing
        login.snp.makeConstraints{
            $0.height.equalTo(56)
        }
        password.backgroundColor = UIColor(hex: 0xF6F7F8)
        password.layer.cornerRadius = 12
        password.placeholder = "Пароль"
        login.layer.masksToBounds = true
        password.clearButtonMode = .whileEditing
        password.snp.makeConstraints{
            $0.height.equalTo(56)
        }
        signUpStackView.axis = .vertical
        signUpStackView.spacing = 20
        signUpStackView.setCustomSpacing(16, after: login)
        signUpStackView.setCustomSpacing(32, after: password)
        signUpStackView.snp.makeConstraints{
            $0.width.equalToSuperview()
        }
        
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.titleLabel?.font = .systemFont(ofSize: 19)
        enterButton.setTitle("Вход", for: .normal)
        
        let yellowColor = UIColor(hex: 0xFFDD2D)
        let yellowColorImage = UIImage(color: yellowColor)
        
        enterButton.setBackgroundImage(yellowColorImage, for: .normal)
        
        enterButton.layer.cornerRadius = 12
        enterButton.layer.masksToBounds = true
        
        enterButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(350)
        }
    }
    
    private func setUpLabelsStackView(){
        label1.text = "Parking Spots"
        label1.font = UIFont.systemFont(ofSize: 28)
        label1.textAlignment = .center
        label1.snp.makeConstraints{
            $0.width.equalTo(350)
        }

        label2.text = "Бронирование парковочных мест"
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.textAlignment = .center
        label2.snp.makeConstraints{
            $0.width.equalTo(350)
        }
        
        labelsStackView.axis = .vertical
        labelsStackView.setCustomSpacing(8, after: label1)
        labelsStackView.snp.makeConstraints {
            $0.width.equalTo(350)
        }
    }
    
    private func setUpImage(){
        imageView.image = image
        imageView.snp.makeConstraints{
            $0.size.equalTo(150)
        }
    }
    
    private func initialize(){
        self.view.backgroundColor = UIColor.white
        setUpRootStackView()
        
        setUpLabelsStackView()
        
        setUpSignUpStackView()

        setUpImage()
    }


}
