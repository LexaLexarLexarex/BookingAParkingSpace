public protocol IBookingService {
    func getParkingMap(completion: @escaping (Result<[Spot], Error>) -> Void)
}

extension LordOfNetwork: IBookingService {
    public func getParkingMap(completion: @escaping (Result<[Spot], Error>) -> Void) {
        Map().getParkingMap(completion: completion)
    }
}
