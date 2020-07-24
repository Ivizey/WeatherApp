//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Pavel Bondar on 10/31/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherViewController: UIViewController {
    @IBOutlet private weak var showWeatherDataLable: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var searchField: UITextField!
    
    private let disposeBag = DisposeBag()
    private var viewModel: WeatherViewModel!
    
    static func instantiate(viewModel: WeatherViewModel) -> WeatherViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! WeatherViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.rx.text.distinctUntilChanged()
            .throttle(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe { [unowned self] _ in

                let city = self.searchField.text ?? ""
                let weather = self.viewModel.fetchWeatherViewModels(city: city).observeOn(MainScheduler.instance)
                
                weather.bind(to: self.showWeatherDataLable
                    .rx
                    .text
                    .mapObserver{$0.displayData})
                    .disposed(by: self.disposeBag)
                
                weather.bind(to: self.image
                    .rx
                    .image
                    .mapObserver{$0.displayImage})
                    .disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
    }
}
