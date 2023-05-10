// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let confirm = try? JSONDecoder().decode(Confirm.self, from: jsonData)

import Foundation

// MARK: - Confirm
public struct Confirmation: Codable {
    public let carID, parkingSpotID, startTime, endTime: String

    enum CodingKeys: String, CodingKey {
        case carID = "carId"
        case parkingSpotID = "parkingSpotId"
        case startTime, endTime
    }
    
    public init(carID: String, parkingSpotID: String, startTime: String, endTime: String) {
        self.carID = carID
        self.parkingSpotID = parkingSpotID
        self.startTime = startTime
        self.endTime = endTime
    }
}
