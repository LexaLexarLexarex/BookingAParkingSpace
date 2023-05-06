// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? JSONDecoder().decode(Login.self, from: jsonData)

import Foundation

// MARK: - Login
public struct Login: Codable {
    public let type, accessToken: String
    public let refreshToken: String?
}
