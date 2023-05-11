import Foundation
import SnapKit
import UIKit
import LordOfNetwork

protocol IAlreadyConfirmView {}

class AlreadyConfirmViewController: UIViewController{
    private let time, spot: String
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        button.setTitle("Отменить бронь", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        //label.text = "У вас забронировано место"
        label.initLabel(text: "У вас забронировано место", fontSize: 24)
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var reservationContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateTimeView, spotView])
        view.axis = .horizontal
        view.alignment = .center
        return view
    }()
    
    private lazy var spotView: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.initLabel(text: spot, fontSize: 24)
        view.backgroundColor = UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var dateTimeView: UILabel = {
        let view = UILabel()
        view.text = time
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, reservationContainer, button])
        view.alignment = .center
        view.axis = .vertical
        
        return view
    }()
    
    
    init(presenter: AlreadyConfirmPresenter) {
        self.time = presenter.time
        self.spot = LON.place
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(stack)
        reservationContainer.addSubview(spotView)
        reservationContainer.addSubview(dateTimeView)
        
        setupLayout()
    }
    
    private func setupLayout(){
        stack.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(15)
        }
        reservationContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.center.equalToSuperview()
        }
        dateTimeView.snp.makeConstraints{
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(194)
        }
        //dateTimeView.backgroundColor = .blue
        spotView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(53)
            $0.width.equalTo(90)
        }
        spotView.layer.cornerRadius = 12
        
        button.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        titleLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        stack.setCustomSpacing(20, after: button)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        spotView.layer.cornerRadius = 12
    }
    
    @objc func buttonTapped(){
        print("нихуя")
        let alert = UIAlertController(
            title: "Отменить бронь?",
            message: "После подтверждения вы не сможете занять место, но сможете забронировать другое.",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Снять", style: .destructive) { argument in
            self.remove()
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Оставить", style: .cancel))
        present(
            alert,
            animated: true
        )
    }
}

extension AlreadyConfirmViewController: IAlreadyConfirmView {
    
}
