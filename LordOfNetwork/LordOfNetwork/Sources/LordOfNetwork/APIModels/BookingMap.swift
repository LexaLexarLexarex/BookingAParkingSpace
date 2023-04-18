// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let map = try? JSONDecoder().decode(BookingMap.self, from: jsonData)

import Foundation

// MARK: - Map

public struct BookingMap: Codable {
    public let name, address: String
    public let numberOfLevels: Int
    public let levels: [Level]
}

// MARK: - Level

public struct Level: Codable {
    public let layerName: String
    public let numberOfSpots: Int
    public let canvas: Canvas
    public let spots: [Spot]
}

// MARK: - Canvas

public struct Canvas: Codable {
    public let width, height: Int
}

// MARK: - Spot

public struct Spot: Codable {
    public let parkingNumber: String
    public let isAvailable, isFree: Bool
    public let canvas: Canvas
    public let onCanvasCoords: OnCanvasCoords
}

// MARK: - OnCanvasCoords

public struct OnCanvasCoords: Codable {
    public let x, y: Int
}
