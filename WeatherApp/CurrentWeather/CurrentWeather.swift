//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 11/9/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let request: Request
    let location: Location
    let current: Current
}

