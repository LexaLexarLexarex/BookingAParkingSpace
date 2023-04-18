import Foundation

protocol IAuth {
    func auth(user: AuthModel, completion: @escaping (Result<Buildings, Error>) -> Void)
}
