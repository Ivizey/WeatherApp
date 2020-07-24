//
//  Current.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 09.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Current {
    let observationTime: String
    let temperature: String
    let weatherCode: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let windSpeed: String
    let windDegree: String
    let windDir: String
    let pressure: String
//    let precip: String?
    let humidity: String
    let cloudcover: String
    let feelslike: String
    let uvIndex: Int
    let visibility: String
}

extension Current: Decodable {
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure
//        case precip
        case humidity
        case cloudcover
        case feelslike
        case uvIndex = "uv_index"
        case visibility
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        observationTime = try container.decode(String.self, forKey: .observationTime)
        temperature = try String(container.decode(Int.self, forKey: .temperature))
        weatherCode = try container.decode(Int.self, forKey: .weatherCode)
        weatherIcons = try container.decode([String].self, forKey: .weatherIcons)
        weatherDescriptions = try container.decode([String].self, forKey: .weatherDescriptions)
        windSpeed = try String(container.decode(Int.self, forKey: .windSpeed))
        windDegree = try String(container.decode(Int.self, forKey: .windDegree))
        windDir = try container.decode(String.self, forKey: .windDir)
        pressure = try String(container.decode(Int.self, forKey: .pressure))
        humidity = try String(container.decode(Int.self, forKey: .humidity))
        cloudcover = try String(container.decode(Int.self, forKey: .cloudcover))
        feelslike = try String(container.decode(Int.self, forKey: .feelslike))
        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        visibility = try String(container.decode(Int.self, forKey: .visibility))
    }
}
