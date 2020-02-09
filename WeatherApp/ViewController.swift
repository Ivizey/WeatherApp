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
    private let token = "12094feead81a313e94e19a30f2b823a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    private func fetchWeather(search: String?, completionHandler: @escaping ([SearchResponse]?, Error?) -> ()) {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.weatherstack.com"
        components.path = "/current"
        components.queryItems = [URLQueryItem(name: "access_key", value: token),
                                 URLQueryItem(name: "query", value: search)]
        guard let url = components.url else { return }
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    do {
                        let weatherData = try JSONDecoder().decode([SearchResponse].self, from: data)
                        completionHandler(weatherData, nil)
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(nil, error)
                    }
                }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.fetchWeather(search: "Kiev") { (weather, error) in
            print(weather)
        }
    }
}
