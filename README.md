# WeatherApp

A native application built over a day that returns data from [Weatherstack](https://weatherstack.com) and parses the JSON into viewable results. 

<p align="center">
    <img src="https://github.com/Ivizey/WeatherApp/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2011.41.56.png" width="200">
    <img src="https://github.com/Ivizey/WeatherApp/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2011.41.58.png" width="200">
    <img src="https://github.com/Ivizey/WeatherApp/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2012.15.48.png" width="200">
</p>

## Getting Started

The first step to using the API is to authenticate with your weatherstack account's unique API access key, which can be found in your account dashboard after registration. To authenticate with the API, simply use the base URL below and pass your API access key to the API's access_key parameter. ([Details](https://weatherstack.com/documentation))

```
class NetworkService {
    private let ACCESS_KEY = "YOUR_ACCESS_KEY"
        func fetchWeather(search: String?, completionHandler: @escaping (CurrentWeather?, Error?) -> ()) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.weatherstack.com"
        components.path = "/current"
        components.queryItems = [URLQueryItem(name: "access_key", value: ACCESS_KEY),
                                 URLQueryItem(name: "query", value: search)]
        guard let url = components.url else { return }
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    do {
                        let weatherData = try JSONDecoder().decode(CurrentWeather.self, from: data)
                        completionHandler(weatherData, nil)
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(nil, error)
                    }
                }
        }.resume()
    }
}
```

## Deployment

### Data from Weatherstack:
```
struct Request: Codable {
    let type: String
    let query: String
    let language: String
    let unit: String
}

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
}

struct Current: Codable {
    let observationTime: String
    let temperature: Int
    let weatherCode: Int
    let weatherIcons: [String]
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
}
```

### List of weather customization icons:
```
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
```

