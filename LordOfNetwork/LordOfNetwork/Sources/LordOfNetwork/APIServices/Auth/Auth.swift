import Foundation

class Auth: IAuth {
    func auth(user: AuthModel, completion: @escaping (Result<Employee, Error>) -> Void) {
        let loginString = user.login + ":" + user.password
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return
        }
        let base64LoginString = loginData.base64EncodedString()
        LON.isLexa.request.makeRequest(
            for: URL(string: LON.isLexa.domen + "/employees/123e4567-e89b-12d3-a456-426655440000")!,
            method: LONService.Method.get,
            query: LONService.QueryType.json,
            headers: ["Authorization": "Basic \(base64LoginString)"],
            completion: { result in
                switch result { // http://localhost:8080/employees/123e4567-e89b-12d3-a456-426655440000
                case let .success(employee):
                    do {
                        if let data = employee {
                            let profile = try JSONDecoder().decode(Employee.self, from: data)
                            completion(.success(profile))
                        } else { completion(.failure(LONServiceError(code: .emptyData))) }
                    } catch {
                        print(error, error.localizedDescription)
                        completion(.failure(error))
                    }
                case let .failure(error):
                    print(error, error.code, error.errorUserInfo)
                    completion(.failure(error))
                }
            }
        )
    }
}

public struct AuthModel: Codable {
    public let login, password: String

    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
