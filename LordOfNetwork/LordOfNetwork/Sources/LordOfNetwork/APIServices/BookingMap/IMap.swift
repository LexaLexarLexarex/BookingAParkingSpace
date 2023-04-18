import Foundation

protocol IMap {
    func getParkingMap(completion: @escaping (Result<BookingMap, Error>) -> Void)
}
