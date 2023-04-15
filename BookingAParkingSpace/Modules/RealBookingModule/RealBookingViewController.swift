//
//  RealBookingViewController.swift
//  BookingAParkingSpace
//
//  Created by Элина Карапетян on 30.03.2023.
//

import UIKit

protocol IRealBookingView: AnyObject {
    func addDateSelectionView(_ date: UIViewController)
    func addTimeSelectionView(_ time: UIViewController)
}

class RealBookingViewController: UIViewController, IRealBookingView {
    
    let presenter: IRealBookingPresenter
    
    var date: UIViewController?
    
    var time: UIViewController?
    
    let rootStackViewHeight = 400
    
    private lazy var rootStackView = UIStackView(arrangedSubviews: [date!.view, time!.view])

    init(presenter: IRealBookingPresenter, date: UIViewController, time: UIViewController) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.date = date
        self.time = time
        setUp()
    }
    
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RealBookingViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setUp(){
        view.addSubview(rootStackView)
        rootStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(36)
            $0.height.equalTo(400)
            $0.width.equalToSuperview()
        }
        rootStackView.axis = .vertical
    }
    
}

extension RealBookingViewController{
    func addDateSelectionView(_ date: UIViewController) {
//        add(date)
        date.view.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(rootStackView.safeAreaLayoutGuide).inset(rootStackViewHeight/4)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height/2)
        }
    }
    
    func addTimeSelectionView(_ time: UIViewController) {
////        add(time)
        time.view.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(rootStackViewHeight/4)
//            make.width.equalTo(390)
//            make.height.equalTo(80)
////            $0.leading.trailing.bottom.equalToSuperview()
////            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height / 2)
        }
    }
        
}
