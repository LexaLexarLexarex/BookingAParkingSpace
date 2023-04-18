public protocol IAuthTool {
    func auth(with model: AuthModel, completion: @escaping (Result<Buildings, Error>) -> Void)
}

extension LordOfNetwork: IAuthTool {
    public func auth(with model: AuthModel, completion: @escaping (Result<Buildings, Error>) -> Void) {
        authService.auth(
            user: model,
            completion: completion
        )
    }
}
