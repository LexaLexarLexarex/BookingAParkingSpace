//
//  ConfirmationPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation

protocol IConfirmationPresenter {
    func didTapConfirmationButton()
    func getConfirmationData(for index: Int) -> String
    func getConfirmationAttributes(for index: Int) -> String
}

class ConfirmationPresenter {
    weak var view: IConfirmationView?
    
    let labelsDataSource = ["Место", "Дата и время", "Автомобиль"]
    let labelAttributesSource: [String]
    
    init(view: IConfirmationView? = nil, attributes: [String]) {
        self.view = view
        
        self.labelAttributesSource = attributes
    }
}

extension ConfirmationPresenter: IConfirmationPresenter {
    func didTapConfirmationButton() {
        print("didTapConfirmationButton")
    }
    
    func getConfirmationData(for index: Int) -> String {
        labelsDataSource[index]
    }
    
    func getConfirmationAttributes(for index: Int) -> String {
        labelAttributesSource[index]
    }
}
