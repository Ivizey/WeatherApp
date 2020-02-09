//
//  ViewController.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 10/31/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    private let ACCESS_KEY = "YOUR_ACCESS_KEY"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        fetchWeather(search: "Cherkassy") { (weather, error) in
            DispatchQueue.main.async {
                self.cityLabel.text = weather?.location.name
                self.temperatureLabel.text = "\(weather?.current.temperature ?? 0)"
            }
        }
    }
    
    private func fetchWeather(search: String?, completionHandler: @escaping (CurrentWeather?, Error?) -> ()) {
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

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
