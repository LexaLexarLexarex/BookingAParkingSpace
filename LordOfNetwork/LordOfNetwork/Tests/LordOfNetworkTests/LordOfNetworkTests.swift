@testable import LordOfNetwork
import XCTest

final class LordOfNetworkTests: XCTestCase {
    let LON = LordOfNetwork(authService: Auth())

    func testText() throws {
        XCTAssertEqual(LON.domen, "http://localhost:8080")
    }
}
