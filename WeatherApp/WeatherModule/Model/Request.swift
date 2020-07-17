//
//  Request.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 09.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Request: Decodable {
    let type: String
    let query: String
    let language: String
    let unit: String
}
