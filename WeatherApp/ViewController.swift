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
    @IBOutlet weak var localtimeLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feelslikeLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    private let networkServices = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData() {
        networkServices.fetchWeather(search: "Kiev") { [weak self] (weather, error) in
            guard let weather = weather else { return }
            DispatchQueue.main.async {
                self?.temperatureLabel.text = String(weather.current.temperature) + " ºC"
                self?.cityLabel.text = weather.location.name
                self?.localtimeLabel.text = weather.location.localTime
                self?.descriptionsLabel.text = weather.current.weatherDescriptions.first
                self?.windSpeedLabel.text = "wind speed: " + String(weather.current.windSpeed)
                self?.windDirLabel.text = "wind direction: " + weather.current.windDir
                self?.humidityLabel.text = "humidity: " + String(weather.current.humidity)
                self?.feelslikeLabel.text = "feelslike: " + String(weather.current.feelslike)
                self?.visibilityLabel.text = "visibility: " + String(weather.current.visibility)
            }
        }
    }
}
