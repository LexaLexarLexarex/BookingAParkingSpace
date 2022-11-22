// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parkingSpots = try? newJSONDecoder().decode(ParkingSpots.self, from: jsonData)

import Foundation

// MARK: - ParkingSpots
struct ParkingSpot: Codable {
    let id: String
    let parkingNumber: Int
    let isFree: Bool
}

typealias ParkingSpots = [ParkingSpot]
