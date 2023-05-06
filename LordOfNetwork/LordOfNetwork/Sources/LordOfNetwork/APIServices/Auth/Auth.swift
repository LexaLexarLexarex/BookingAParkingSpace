import Foundation

class Auth: IAuth {
    func auth(user: AuthModel, completion: @escaping (Result<Login, Error>) -> Void) {
        let loginModel = LoginModel(email: user.login, password: user.password)
        LON.isLexa.request.makeRequest(
            for: URL(string: LON.isLexa.domen + "/auth/login")!,
            method: LONService.Method.post,
            body: loginModel,
            headers: ["Content-Type": "application/json"],
            completion: { result in
                switch result {
                case let .success(employee):
                    do {
                        if let data = employee {
                            let profile = try JSONDecoder().decode(Login.self, from: data)
                            LON.tokenAccess = profile.accessToken
                            LON.tokenRefresh = profile.refreshToken ?? ""
                            self.refresh(refreshToken: LON.tokenRefresh)
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
    
    func whoami(completion: @escaping (Result<Login, Error>) -> Void) {
        LON.isLexa.request.makeRequest(
            for: URL(string: LON.isLexa.domen + "/auth/whoami")!,
            method: LONService.Method.get,
            query: .path,
            headers: ["Authorization" : "Bearer \(LON.tokenAccess)"],
            completion: { result in
                switch result {
                case let .success(employee):
                    do {
                        if let data = employee {
                            let profile = try JSONDecoder().decode(Login.self, from: data)
                            LON.tokenAccess = profile.accessToken
                            LON.tokenRefresh = profile.refreshToken ?? ""
                            self.refresh(refreshToken: LON.tokenRefresh)
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
    
    private func refresh(refreshToken: String){
        let refresh = Refresh(refreshToken: refreshToken)
        LON.isLexa.request.makeRequest(
            for: URL(string: LON.isLexa.domen + "/auth/update/access")!,
            method: LONService.Method.post,
            body: refresh,
            headers: ["Content-Type": "application/json", "Authorization" : "Bearer \(LON.tokenAccess)"],
            completion: { result in
                switch result {
                case let .success(employee):
                    do {
                        if let data = employee {
                            let profile = try JSONDecoder().decode(Login.self, from: data)
                            LON.tokenAccess = profile.accessToken
                            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 100){
                                self.refresh(refreshToken: LON.tokenRefresh)
                            }
                        }
                    } catch {
                        print(error, error.localizedDescription)
                    }
                case let .failure(error):
                    print(error, error.code, error.errorUserInfo)
                }
            }
        )
        
    }
    private struct Refresh: Codable {
        let refreshToken: String
    }
}

public struct AuthModel: Codable {
    public let login, password: String

    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
