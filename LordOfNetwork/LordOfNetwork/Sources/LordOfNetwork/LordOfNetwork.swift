import Foundation

public typealias LON = LordOfNetwork

public struct LordOfNetwork {
    public static let isLexa = LordOfNetwork(
        authService: Auth()
    )
    public static var tokenAccess = "none"
    public static var tokenRefresh = "none"
    public private(set) var domen = "http://91.185.85.37:8080"
    let request = LONService()

//    {
//      "id": "123e4567-e89b-12d3-a456-426655440000",
//      "name": "Alexey Dolgopolov"
//    }
    // http://localhost:8080/employees/123e4567-e89b-12d3-a456-426655440000

    let authService: IAuth
    let bookingService: IMap = Map()

    init(authService: IAuth) {
        self.authService = authService
    }
}
