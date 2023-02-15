//
//  ViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 17.01.2023.
//

import UIKit
import SnapKit
import LordOfNetwork

protocol IMainView: AnyObject {
    func updateUsersInfo(with value: String)
}

class MainViewController: UIViewController, IMainView {
    
    private let presenter: IMainPresenter

    private lazy var enterButton = UIButton()
    private lazy var label1 = UILabel()
    private lazy var label2 = UILabel()
    private lazy var imageView = UIImageView()
    private lazy var image = UIImage(named: "Logo")
    private lazy var login = TextField()
    private lazy var password = TextField()
    
    private lazy var labelsStackView = UIStackView(arrangedSubviews: [label1, label2])
    private lazy var rootStackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, signUpStackView])
    private lazy var signUpStackView = UIStackView(arrangedSubviews: [login, password, enterButton])
        
    init(presenter: IMainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.left.right.equalToSuperview().inset(20)
            $0.center.equalToSuperview()
        }
    }
    
    private func setUpSignUpStackView() {
        login.initAuthTextField(placeholder: "Имя пользователя")
                
        password.initAuthTextField(placeholder: "Пароль")
        
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
        
        enterButton.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
    }
    
    private func setUpLabelsStackView(){
        label1.initLabel(text: "Parking Spots", fontSize: 28)

        label2.initLabel(text: "Бронирование парковочных мест", fontSize: 16)
        
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
        
        setupKeyboardHiding()
    }
    
    private func setupKeyboardHiding(){
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(signUpStackView.frame, from: signUpStackView.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
    }
    
    @objc private func keyboardWillHide(){
        view.frame.origin.y = 0
        
    }
    
    @objc private func didTapEnterButton() {
        presenter.didTapEnter(login: login.text!, password: password.text!)
    }
    
    func updateUsersInfo(with value: String) {
    }

}


