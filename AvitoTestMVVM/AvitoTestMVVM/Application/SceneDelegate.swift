//
//  SceneDelegate.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = MainViewController()
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.largeTitleDisplayMode = .automatic
        vc.title = "Товары"
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
}

