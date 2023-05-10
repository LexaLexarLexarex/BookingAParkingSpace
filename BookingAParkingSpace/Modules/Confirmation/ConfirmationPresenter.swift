//
//  ConfirmationPresenter.swift
//  BookingAParkingSpace
//
//  Created by a.g.dolgopolov on 19.04.2023.
//

import Foundation
import LordOfNetwork

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
        let start = labelAttributesSource[4].prefix(5)
        let end = labelAttributesSource[4].suffix(5)
        let body = Confirmation(
            carID: "4d867dbc-381c-460d-b232-ed651da2bf1c",
            parkingSpotID: labelAttributesSource[5],
            startTime: "2023-05-\(labelAttributesSource[3])T\(start):00.00Z",
            endTime: "2023-05-\(labelAttributesSource[3])T\(end):00.00Z"
        )
        
        LON.place = labelAttributesSource[0]
        LON.isLexa.confirm(
            with: body,
            completion: { result in
                switch result {
                case .success(let confirmModel):
                    self.view?.openAlreadyConfirm(with: confirmModel)
                    break
                case .failure(_):
                    break
                }
            }
        )
    }
    
    func getConfirmationData(for index: Int) -> String {
        labelsDataSource[index]
    }
    
    func getConfirmationAttributes(for index: Int) -> String {
        labelAttributesSource[index]
    }
}
