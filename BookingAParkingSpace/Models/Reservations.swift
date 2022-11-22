// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let reservations = try? newJSONDecoder().decode(Reservations.self, from: jsonData)

import Foundation

// MARK: - Reservations
struct Reservation: Codable {
    let id, carID, employeeID, parkingSpotID: String
    let startTime, endTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case carID = "carId"
        case employeeID = "employeeId"
        case parkingSpotID = "parkingSpotId"
        case startTime, endTime
    }
}

typealias Reservations = [Reservation]
