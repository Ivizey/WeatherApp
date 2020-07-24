//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 20.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct DisplayViewModel {
    private let weather: Weather
    
    var displayTemperature: String {
        guard let temperature = weather.current?.temperature else { return "" }
        return String(temperature)
    }
    var displayCity: String {
        guard let city = weather.location?.name else { return "" }
        return city
    }
    var displayLocation: String {
        guard let location = weather.location?.country else { return "" }
        return "Country: " + location
    }
    var displayDescription: String {
        guard let description = weather.current?.weatherDescriptions.first else { return "" }
        return "Description: " + description
    }
    var displayWindSpeed: String {
        guard let windSpeed = weather.current?.windSpeed else { return "" }
        return "Wind speed: " + String(windSpeed)
    }
    var displayWindDir: String {
        guard let windDir = weather.current?.windDir else { return "" }
        return "Wind dir: " + windDir
    }
    var displayHumidity: String {
        guard let humidity = weather.current?.humidity else { return "" }
        return "Humidity: " + String(humidity)
    }
    var displayFeelslike: String {
        guard let feelslike = weather.current?.feelslike else { return "" }
        return "Feelslike: " + String(feelslike)
    }
    var displayVisibility: String {
        guard let visibility = weather.current?.visibility else { return "" }
        return "Visibility" + String(visibility)
    }
    
    init(weather: Weather) {
        self.weather = weather
    }
}
