import Foundation

// swiftlint:disable file_length
// swiftlint:disable type_body_length
class Map: IMap {
    func getParkingMap(completion: @escaping (Result<[Spot], Error>) -> Void) {
        LON.isLexa.request.makeRequest(
            for: URL(string: LON.isLexa.domen + "/parkingLevels/94d7a10b-f7c6-4d52-a156-b809f2611d52/spots")!,
            method: LONService.Method.get,
            query: .path,
            headers: ["Authorization" : "Bearer \(LON.tokenAccess)"],
            completion: { result in
                switch result {
                case let .success(employee):
                    do {
                        if let data = employee {
                            let model = try JSONDecoder().decode([Spot].self, from: data)
                            completion(.success(model))
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
