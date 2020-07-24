//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 16.06.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift

final class WeatherViewModel {
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func fetchWeatherViewModels(city: String) -> Observable<DisplayViewModel> {
        weatherService.fetchWeather(city: city).map { weather in
            DisplayViewModel(weather: weather)
        }
    }
}
