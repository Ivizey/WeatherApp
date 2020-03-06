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
    @IBOutlet weak var image: UIImageView!
    private let networkServices = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(search: "Cherkasy")
    }
    
    private func createAlert() {
        let alert = UIAlertController(title: "Error",
                                      message: "Data not found\nInput correct data",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Refresh", style: .default, handler: { _ in
            self.setData(search: "Cherkasy")
        }))
        self.present(alert, animated: true)
    }
    
    private func setData(search: String) {
        networkServices.fetchWeather(search: search) { [weak self] (weather, error) in
            guard let weather = weather else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self?.createAlert()
                }
                return
            }
            DispatchQueue.main.async {
                let image = self?.networkServices.images[weather.current.weatherCode]
                self?.image.image = UIImage(systemName: image ?? "globe")
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
