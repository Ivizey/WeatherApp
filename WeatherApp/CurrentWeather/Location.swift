//
//  Location.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 09.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Location: Codable {
    let name: String
    let country: String
    let region: String
    let lat: String
    let lon: String
    let timeZoneID: String
    let localTime: String
    let localTimeEpoch: Int
    let utcOffset: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case region
        case lat
        case lon
        case timeZoneID = "timezone_id"
        case localTime = "localtime"
        case localTimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
    }
}
