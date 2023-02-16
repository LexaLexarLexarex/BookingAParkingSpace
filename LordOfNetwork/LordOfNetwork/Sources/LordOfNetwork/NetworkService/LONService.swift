import Foundation

class LONService {
    private var successCodes: CountableRange<Int> = 200 ..< 299
    private var failureCodes: CountableRange<Int> = 400 ..< 599

    enum Method: String {
        case get = "GET"
        case patch = "PATCH"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case update = "UPDATE"
    }

    enum QueryType {
        case json, path
    }

    func makeRequest<T: Codable>(
        for url: URL, method: Method,
        params: [String: String]? = nil,
        body: T,
        headers: [String: String]? = nil,
        completion: @escaping (Result<Data?, LONServiceError>) -> Void
    ) {
        var mutableRequest = buildRequest(
            url: url, method: method,
            params: params, headers: headers
        )
        let jsonBody = try! JSONEncoder().encode(body)
        mutableRequest.httpBody = jsonBody
        let session = URLSession.shared

        let task = session.dataTask(
            with: mutableRequest as URLRequest,
            completionHandler: { data, response, error in
                do {
                    if let error = error { throw error }
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw LONServiceError(
                            code: .unexpectedResonse,
                            errorUserInfo: [NSLocalizedFailureReasonErrorKey: "unexpected reponse"]
                        )
                    }
                    if self.successCodes.contains(httpResponse.statusCode) {
                        DispatchQueue.main.async { completion(.success(data)) }
                    } else if self.failureCodes.contains(httpResponse.statusCode) {
                        throw LONServiceError(
                            code: .errorStatusCode,
                            errorUserInfo: ["statusCode": httpResponse.statusCode]
                        )
                    } else {
                        throw LONServiceError(
                            code: .requestFailed,
                            errorUserInfo: ["statusCode": httpResponse.statusCode]
                        )
                    }

                } catch let error as LONServiceError {
                    DispatchQueue.main.async { completion(.failure(error)) }
                } catch {
                    DispatchQueue.main.async {
                        completion(
                            .failure(
                                LONServiceError(
                                    code: .requestFailed,
                                    errorUserInfo: [NSUnderlyingErrorKey: error]
                                )
                            )
                        )
                    }
                }
            }
        )

        task.resume()
    }

    func makeRequest(
        for url: URL, method: Method, query _: QueryType,
        params: [String: String]? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<Data?, LONServiceError>) -> Void
    ) {
        let mutableRequest = buildRequest(url: url, method: method, params: params, headers: headers)
        let session = URLSession.shared

        let task = session.dataTask(
            with: mutableRequest as URLRequest,
            completionHandler: { data, response, error in
                do {
                    if let error = error { throw error }
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw LONServiceError(
                            code: .unexpectedResonse,
                            errorUserInfo: [NSLocalizedFailureReasonErrorKey: "unexpected reponse"]
                        )
                    }
                    if self.successCodes.contains(httpResponse.statusCode) {
                        DispatchQueue.main.async { completion(.success(data)) }
                    } else if self.failureCodes.contains(httpResponse.statusCode) {
                        throw LONServiceError(
                            code: .errorStatusCode,
                            errorUserInfo: ["statusCode": httpResponse.statusCode]
                        )
                    } else {
                        throw LONServiceError(
                            code: .requestFailed,
                            errorUserInfo: ["statusCode": httpResponse.statusCode]
                        )
                    }

                } catch let error as LONServiceError {
                    DispatchQueue.main.async { completion(.failure(error)) }
                } catch {
                    DispatchQueue.main.async {
                        completion(
                            .failure(
                                LONServiceError(
                                    code: .requestFailed,
                                    errorUserInfo: [NSUnderlyingErrorKey: error]
                                )
                            )
                        )
                    }
                }
            }
        )

        task.resume()
    }
}

private extension LONService {
    func buildRequest(
        url: URL,
        method: Method,
        params: [String: String]? = nil,
        headers: [String: String]? = nil
    ) -> URLRequest {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = params?.reduce(into: [URLQueryItem]()) { queryItems, param in
            queryItems.append(URLQueryItem(name: param.key, value: param.value))
        }

        var mutableRequest = URLRequest(
            url: components.url!,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0
        )

        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue

        return mutableRequest
    }
}
