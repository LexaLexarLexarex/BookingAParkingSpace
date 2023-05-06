// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let whoAmI = try? JSONDecoder().decode(WhoAmI.self, from: jsonData)

import Foundation

// MARK: - WhoAmI
struct WhoAmI: Codable {
    let id, email, name: String
    let roles: [String]
    let principal: String
}
