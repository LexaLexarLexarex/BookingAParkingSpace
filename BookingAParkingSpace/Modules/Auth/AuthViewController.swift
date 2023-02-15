//
//  ViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 17.01.2023.
//

import LordOfNetwork
import SnapKit
import UIKit

// MARK: - IAuthView

protocol IAuthView: AnyObject {
    func updateUsersInfo(with value: Employee)
    func showError(_ text: String)
}

extension AuthViewController: IAuthView {
    func updateUsersInfo(with _: Employee) {
        let alert = UIAlertController(
            title: "Красава",
            message: "ZHOPA",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "войти", style: .cancel))
        present(
            alert,
            animated: true
        )
    }

    func showError(_ text: String) {
        let alert = UIAlertController(
            title: "Косячок, браток",
            message: text,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "выйти, хоть и хотелось бы войти", style: .cancel))
        present(
            alert,
            animated: true
        )
    }
}

// MARK: - AuthViewController

class AuthViewController: UIViewController {
    private let presenter: IAuthPresenter

    private lazy var enterButton = UIButton()

    // Logo
    private lazy var imageView = UIImageView()
    private lazy var image = UIImage(named: "Logo")

    // Header
    private lazy var headerView = UIStackView(arrangedSubviews: [headerTitle, headerSubtitle])
    private lazy var headerTitle = UILabel()
    private lazy var headerSubtitle = UILabel()

    // TextFields
    private lazy var loginTextField = TextField()
    private lazy var passwordTextField = TextField()

    private lazy var rootStackView = UIStackView(arrangedSubviews: [imageView, headerView, signUpStackView])
    private lazy var signUpStackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, enterButton])

    // MARK: - Init

    init(presenter: IAuthPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    // MARK: - Setup
}

private extension AuthViewController {
    func initialize() {
        view.backgroundColor = UIColor.white

        setUpRootStackView()
        setUpLabelsStackView()
        setUpSignUpStackView()
        setUpImage()
        setupKeyboardHiding()
        setupLayouts()
    }

    func setUpRootStackView() {
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.setCustomSpacing(24, after: imageView)
        rootStackView.setCustomSpacing(64, after: headerView)
        view.addSubview(rootStackView)
    }

    func setUpSignUpStackView() {
        loginTextField.initAuthTextField(placeholder: "Имя пользователя")

        passwordTextField.initAuthTextField(placeholder: "Пароль")

        signUpStackView.axis = .vertical
        signUpStackView.spacing = 20
        signUpStackView.setCustomSpacing(16, after: loginTextField)
        signUpStackView.setCustomSpacing(32, after: passwordTextField)

        enterButton.setTitleColor(.black, for: .normal)
        enterButton.titleLabel?.font = .systemFont(ofSize: 19)
        enterButton.setTitle("Вход", for: .normal)

        let yellowColor = UIColor(hex: 0xFFDD2D)
        let yellowColorImage = UIImage(color: yellowColor)

        enterButton.setBackgroundImage(yellowColorImage, for: .normal)

        enterButton.layer.cornerRadius = 12
        enterButton.layer.masksToBounds = true
        enterButton.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
    }

    func setUpLabelsStackView() {
        headerTitle.initLabel(text: "Parking Spots", fontSize: 28)
        headerSubtitle.initLabel(text: "Бронирование парковочных мест", fontSize: 16)

        headerView.axis = .vertical
        headerView.setCustomSpacing(8, after: headerTitle)
    }

    func setUpImage() {
        imageView.image = image
    }

    func setupKeyboardHiding() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func setupLayouts() {
        rootStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.center.equalToSuperview()
        }
        signUpStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        enterButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(350)
        }

        headerView.snp.makeConstraints {
            $0.width.equalTo(350)
        }
        imageView.snp.makeConstraints {
            $0.size.equalTo(150)
        }
    }
}

private extension AuthViewController {
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let _ = UIResponder.currentFirst() as? UITextField else { return }

        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(signUpStackView.frame, from: signUpStackView.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
    }

    @objc func keyboardWillHide() {
        view.frame.origin.y = 0
    }

    @objc func didTapEnterButton() {
        presenter.didTapEnter(login: loginTextField.text!, password: passwordTextField.text!)
    }
}
