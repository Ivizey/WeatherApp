//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 10/31/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var localtimeLabel: UILabel!
    @IBOutlet private weak var descriptionsLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var windDirLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var feelslikeLabel: UILabel!
    @IBOutlet private weak var visibilityLabel: UILabel!
    @IBOutlet private weak var image: UIImageView!
    
    static func instantiate() -> WeatherViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! WeatherViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
