//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 20.07.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol WeatherServiceProtocol {
    func fetchWeather(city: String) -> Observable<Weather>
}

class WeatherService: WeatherServiceProtocol {
    
    enum GetWeatherFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    func fetchWeather(city: String) -> Observable<Weather> {
        return Observable.create { observer -> Disposable in
            var components = URLComponents()
            components.scheme = "http"
            components.host = "api.weatherstack.com"
            components.path = "/current"
            components.queryItems = [URLQueryItem(name: "access_key", value: "12094feead81a313e94e19a30f2b823a")]
            guard let url = components.url else { return Disposables.create() }
            Alamofire.request(url, method: .get, parameters: ["query": city])
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? GetWeatherFailureReason.notFound)
                            return
                        }
                        do {
                            let weather = try JSONDecoder().decode(Weather.self, from: data)
                            observer.onNext(weather)
                        } catch {
                            let weather = Weather.makeDefault()
                            observer.onNext(weather)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetWeatherFailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
}
