import Foundation

struct LONServiceError: CustomNSError {
    enum Code: Int {
        case unexpectedResonse
        case requestFailed
        case errorStatusCode
        case emptyData
    }

    var code: Code

    /// The error code within the given domain.
    var errorCode: Int { code.rawValue }

    /// The user-info dictionary.
    var errorUserInfo: [String: Any]

    init(code: Code, errorCode _: Int = 0, errorUserInfo: [String: Any] = ["": ""]) {
        self.code = code
        self.errorUserInfo = errorUserInfo
    }
}
