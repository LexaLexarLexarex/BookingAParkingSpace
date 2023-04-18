import Foundation

// MARK: - Building

public struct Building: Codable {
    let id, name, address: String
    let numberOfLevels: Int
}

public typealias Buildings = [Building]
