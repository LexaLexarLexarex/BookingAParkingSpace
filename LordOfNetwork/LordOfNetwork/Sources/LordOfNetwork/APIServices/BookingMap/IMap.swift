import Foundation

protocol IMap {
    func getParkingMap(completion: @escaping (Result<[Spot], Error>) -> Void)
}
