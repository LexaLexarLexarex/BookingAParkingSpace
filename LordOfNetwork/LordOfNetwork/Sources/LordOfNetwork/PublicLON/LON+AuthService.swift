public protocol IAuthService {
    func auth(with model: AuthModel, completion: @escaping (Result<Login, Error>) -> Void)
}

extension LordOfNetwork: IAuthService {
    public func auth(with model: AuthModel, completion: @escaping (Result<Login, Error>) -> Void) {
        authService.auth(
            user: model,
            completion: completion
        )
    }
}
