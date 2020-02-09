//
//  Current.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 09.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Current: Decodable {
    let observationTime: String
    let temparature: Int
    let weatherCode: Int
    let weatherIcons: [URL]
    let weatherDescriptions: [String]
    let windSpeed: Int
    let windDegree: Int
    let windDir: String
    let pressure: Int
    let precip: Int
    let humidity: Int
    let cloudcover: Int
    let feelslike: Int
    let uvIndex: Int
    let visibility: Int
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temparature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure
        case precip
        case humidity
        case cloudcover
        case feelslike
        case uvIndex = "uv_index"
        case visibility
    }
}
