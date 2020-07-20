//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 10/31/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordintor: AppCoordintor?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        appCoordintor = AppCoordintor(window: window)
        appCoordintor?.start()
    }
}

