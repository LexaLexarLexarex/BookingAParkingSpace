public protocol IBookingTool {
    func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void)
}

extension LordOfNetwork: IBookingTool {
    public func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void) {
        Map().getParkingMap(completion: completion)
    }
}
