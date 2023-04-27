public protocol IAuthService {
    func auth(with model: AuthModel, completion: @escaping (Result<Buildings, Error>) -> Void)
}

extension LordOfNetwork: IAuthService {
    public func auth(with model: AuthModel, completion: @escaping (Result<Buildings, Error>) -> Void) {
        authService.auth(
            user: model,
            completion: completion
        )
    }
}
