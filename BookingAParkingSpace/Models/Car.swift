// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let car = try? newJSONDecoder().decode(Car.self, from: jsonData)

import Foundation

// MARK: - Car
struct Car: Codable {
    let id, model: String
    let length, wight: Int
    let registryNumber: String
}

typealias Cars = [Car]
