// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let reservations = try? newJSONDecoder().decode(Reservations.self, from: jsonData)

import Foundation

// MARK: - Reservations

public struct Reservation: Codable {
    public let id, carID: String?
    public let employeeID, parkingSpotID: String?
    public let startTime, endTime: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case carID = "carId"
        case employeeID = "employeeId"
        case parkingSpotID = "parkingSpotId"
        case startTime, endTime
    }
    public init(id: String?, carID: String?, employeeID: String?, parkingSpotID: String?, startTime: String?, endTime: String?) {
        self.id = id
        self.carID = carID
        self.employeeID = employeeID
        self.parkingSpotID = parkingSpotID
        self.startTime = startTime
        self.endTime = endTime
    }
}

typealias Reservations = [Reservation]
