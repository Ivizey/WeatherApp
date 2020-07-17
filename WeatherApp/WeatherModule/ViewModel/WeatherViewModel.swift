//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 16.06.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

class WeatherViewModel {
    var weather: Weather?
    var error: Error?
    var refreshing = false
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchWeather(completion: @escaping() -> Void) {
        refreshing = true
        networkService.fetchWeather(search: "Kiev") { [weak self] (weather, error) in
            self?.weather = weather
            self?.error = error
            self?.refreshing = false
            completion()
        }
    }
}
