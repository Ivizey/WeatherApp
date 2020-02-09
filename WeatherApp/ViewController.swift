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
    private let networkServices = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        getData()
    }
    
    private func getData() {
        networkServices.fetchWeather(search: "Киев") { [weak self] (weather, error) in
            guard let weather = weather else { return }
            DispatchQueue.main.async {
                self?.cityLabel.text = weather.location.name
                self?.temperatureLabel.text = String(weather.current.temperature)
            }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
