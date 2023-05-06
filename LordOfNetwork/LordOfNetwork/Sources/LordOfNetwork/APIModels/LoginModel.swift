// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
public struct LoginModel: Codable {
    public let email, password: String
}
