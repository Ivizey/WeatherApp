//
//  SearchResponse.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 11/9/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    let location: Location
    let current: Current
}

