import Foundation

public protocol AuthToKeyChain {
    func oldAuth() -> AuthModel?

    func setAuth(model: AuthModel)

    func removeAuth()
}

extension LordOfNetwork: AuthToKeyChain {
    public func oldAuth() -> AuthModel? {
        guard let myPass = KeyChainService.getKeychainData(key: "password"),
              let myLog = KeyChainService.getKeychainData(key: "login")
        else { return nil }
        return AuthModel(
            login: String(decoding: myLog, as: UTF8.self),
            password: String(decoding: myPass, as: UTF8.self)
        )
    }

    public func setAuth(model: AuthModel) {
        _ = KeyChainService.save(key: "password", data: Data(model.password.utf8))
        _ = KeyChainService.save(key: "login", data: Data(model.login.utf8))
    }

    public func removeAuth() {
        _ = KeyChainService.delete(key: "password")
        _ = KeyChainService.delete(key: "login")
    }
}
