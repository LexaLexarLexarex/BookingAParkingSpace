public protocol IBookingService {
    func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void)
}

extension LordOfNetwork: IBookingService {
    public func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void) {
        Map().getParkingMap(completion: completion)
    }
}
