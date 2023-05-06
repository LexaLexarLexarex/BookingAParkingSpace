import Foundation

protocol IAuth {
    func auth(user: AuthModel, completion: @escaping (Result<Login, Error>) -> Void)
}
