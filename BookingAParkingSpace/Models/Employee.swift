// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let employee = try? newJSONDecoder().decode(Employee.self, from: jsonData)

import Foundation

// MARK: - Employee
struct Employee: Codable {
    let id, name: String
}
