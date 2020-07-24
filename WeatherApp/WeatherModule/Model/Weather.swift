//
//  Weather.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 15.06.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let request: Request?
    let location: Location?
    let current: Current?
}

extension Weather {
    static func makeDefault() -> Weather {
        return Weather(request: nil, location: nil, current: nil)
    }
}
