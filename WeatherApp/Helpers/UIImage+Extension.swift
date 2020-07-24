//
//  UIImage+Extension.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 22.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

extension UIImage {
    func setWeatherImage(code: Int?) -> UIImage {
        let images: [Int: String] = [
            395: "cloud.snow.fill",//"Moderate or heavy snow in area with thunder",
            392: "cloud.snow",//"Patchy light snow in area with thunder",
            389: "cloud.bolt.rain",//"Moderate or heavy rain in area with thunder",
            386: "cloud.rain",//"Patchy light rain in area with thunder",
            377: "cloud.rain.fill",//"Moderate or heavy showers of ice pellets",
            374: "cloud.heavyrain",//"Light showers of ice pellets",
            371: "cloud.snow.fill",//"Moderate or heavy snow showers",
            368: "snow",//"Light snow showers",
            365: "cloud.snow",//"Moderate or heavy sleet showers",
            362: "thermometer.snowflake",//"Light sleet showers",
            359: "cloud.rain.fill",//"Torrential rain shower",
            356: "cloud.heavyrain",//"Moderate or heavy rain shower",
            353: "cloud.heavyrain",//"Light rain shower",
            350: "thermometer.snowflake",//"Ice pellets",
            338: "cloud.sleet.fill",//"Heavy snow",
            335: "cloud.snow.fill",//"Patchy heavy snow",
            332: "snow",//"Moderate snow",
            329: "snow",//"Patchy moderate snow",
            326: "snow",//"Light snow",
            323: "snow",//"Patchy light snow",
            320: "cloud.sleet.fill",//"Moderate or heavy sleet",
            317: "snow",//"Light sleet",
            314: "cloud.hail.fill",//"Moderate or Heavy freezing rain",
            311: "cloud.hail",//"Light freezing rain",
            308: "cloud.hail.fill",//"Heavy rain",
            305: "cloud.rain.fill",//"Heavy rain at times",
            302: "cloud.hail",//"Moderate rain",
            299: "cloud.hail",//"Moderate rain at times",
            296: "cloud.heavyrain",//"Light rain",
            293: "cloud.heavyrain",//"Patchy light rain",
            284: "cloud.rain.fill",//"Heavy freezing drizzle",
            281: "cloud.rain",//"Freezing drizzle",
            266: "cloud.rain",//"Light drizzle",
            263: "cloud.rain",//"Patchy light drizzle",
            260: "cloud.fog.fill",//"Freezing fog",
            248: "cloud.fog",//"Fog",
            230: "wind.snow",//"Blizzard",
            200: "snow",//"Thundery outbreaks in nearby",
            185: "cloud.sleet.fill",//"Patchy freezing drizzle nearby",
            182: "thermometer.snowflake",//"Patchy sleet nearby",
            179: "cloud.rain",//"Patchy snow nearby",
            176: "cloud.rain",//"Patchy rain nearby",
            143: "cloud.fog",//"Mist",
            122: "cloud",//"Overcast",
            119: "cloud.fill",//"Cloudy",
            116: "cloud",//"Partly Cloudy",
            113: "sun.max.fill",//"Clear/Sunny",
        ]
        let image = UIImage(systemName: "icloud.and.arrow.down") ?? UIImage()
        guard let code = code else { return image }
        guard let weatherImage = UIImage(systemName: images[code] ?? "icloud.and.arrow.down") else { return UIImage() }
        return weatherImage
    }
}
