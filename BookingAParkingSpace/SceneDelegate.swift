//
//  SceneDelegate.swift
//  BookingAParkingSpace
//
//  Created by lexar on 22.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow()
        window?.windowScene = scene

        let assembly = BookingAssembly()

        window?.rootViewController = assembly.assemble()
        window?.makeKeyAndVisible()
    }
}
