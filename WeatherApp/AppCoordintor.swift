//
//  AppCoordintor.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 20.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class AppCoordintor {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = WeatherViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
