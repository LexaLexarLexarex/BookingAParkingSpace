import Foundation

protocol IConfirm {
    func confirm(user: Confirmation, completion: @escaping (Result<Reservation, Error>) -> Void)
}

class Confirm: IConfirm {
    func confirm(user: Confirmation, completion: @escaping (Result<Reservation, Error>) -> Void) {
//        LON.isLexa.request.makeRequest(
//            for: URL(string: LON.isLexa.domen + "/reservations/employee")!,
//            method: LONService.Method.post,
//            body: user,
//            headers: ["Content-Type": "application/json", "Authorization" : "Bearer \(LON.tokenAccess)"],
//            completion: {
//                result in
//                switch result {
//                case let .success(employee):
//                    do {
//                        if let data = employee {
//                            let profile = try JSONDecoder().decode(Reservation.self, from: data)
//                            completion(.success(profile))
//                        } else { completion(.failure(LONServiceError(code: .emptyData))) }
//                    } catch {
//                        print(error, error.localizedDescription)
//                        completion(.failure(error))
//                    }
//                case let .failure(error):
//                    print(error, error.code, error.errorUserInfo)
//                    completion(.failure(error))
//                }
//            }
//        )
        completion(
            .success(
                Reservation(
                    id: "reservationID",
                    carID: user.carID,
                    employeeID: "EmprloyeeID",
                    parkingSpotID: user.parkingSpotID,
                    startTime: user.startTime,
                    endTime: user.endTime
                )
            )
        )
    }
}
