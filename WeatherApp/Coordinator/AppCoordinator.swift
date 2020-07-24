//
//  AppCoordintor.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 20.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let weatherViewModel = WeatherViewModel()
        let viewController = WeatherViewController.instantiate(viewModel: weatherViewModel)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
