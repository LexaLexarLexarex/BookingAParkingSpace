public protocol IConfirmService {
    func confirm(with model: Confirmation, completion: @escaping (Result<Reservation, Error>) -> Void)
}

extension LordOfNetwork: IConfirmService {
    public func confirm(with model: Confirmation, completion: @escaping (Result<Reservation, Error>) -> Void) {
        LON.isLexa.confirmService.confirm(user: model, completion: completion)
    }
}
//4d867dbc-381c-460d-b232-ed651da2bf1c
