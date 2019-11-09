//
//  SearchResponse.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 11/9/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var location: [Location]
    var current: [Current]
}

struct Location: Decodable {
    var name: String
    var country: String
    var region: String
    var lat: Float
    var lon: Float
    var timezone_id: String
}

struct Current: Decodable {
    var temperature: Float
    var weather_icons: String
    var weather_descriptions: String
    var wind_speed: Float
    var humidity: Int
    var cloudcover: Int
    var feelslike: Int
    var visibility: Int
}
