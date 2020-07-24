//
//  DisplayViewModel.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 20.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

struct DisplayViewModel {
    private let weather: Weather
    
    private var temperature: String {
        guard let temperature = weather.current?.temperature else { return "no data available ..." }
        return "Temperature: " + String(temperature) + "\n"
    }
    private var city: String {
        return  nilCheck(description: "City", weather.location?.name)
    }
    private var location: String {
        return  nilCheck(description: "Country", weather.location?.country)
    }
    private var description: String {
        return  nilCheck(description: "Description", weather.current?.weatherDescriptions.first)
    }
    private var windSpeed: String {
        return nilCheck(description: "Wind speed", weather.current?.windSpeed)
    }
    private var windDir: String {
        return nilCheck(description: "Wind dir", weather.current?.windDir)
    }
    private var humidity: String {
        return nilCheck(description: "Humidity", weather.current?.humidity)
    }
    private var feelslike: String {
        return nilCheck(description: "Feelslike", weather.current?.feelslike)
    }
    private var visibility: String {
        return  nilCheck(description: "Visibility", weather.current?.visibility)
    }
    
    var displayImage: UIImage {
        return UIImage().setWeatherImage(code: weather.current?.weatherCode)
    }
    
    var displayData: String {
        return temperature + city + location + description + windSpeed + windDir + humidity + feelslike + visibility
    }
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    private func nilCheck(description: String, _ value: String?) -> String {
        guard let value = value else { return "" }
        return description + ": " + value + "\n"
    }
}
