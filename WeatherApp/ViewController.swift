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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        //let urlString = "http://api.weatherstack.com/current?access_key=12094feead81a313e94e19a30f2b823a&query=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))"
        let urlString = "http://api.weatherstack.com/current?access_key=12094feead81a313e94e19a30f2b823a&query=New%20York"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    return
                }
                guard let data = data else { return }
                let someString = String(data: data, encoding: .utf8)
                print(someString ?? "no data")
            }
        }.resume()
    }
}
        
//        var locatinName: String?
//        var temperature: Double?
//        var errorHasOccured: Bool = false
        
//        let task = URLSession.shared.dataTask(with: url!) {[weak self] (data, responce, error) in
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
//
//                if let error = json["error"] {
//                    errorHasOccured = true
//                }
//
//                if let location = json["location"] {
//                    locatinName = location["name"] as? String
//                }
//
//                if let current = json["current"] {
//                    temperature = current["temperature"] as? Double
//                }
//
//                DispatchQueue.main.async {
//                    if errorHasOccured {
//                        self?.cityLabel.text = "Error has occured"
//                        self?.temperatureLabel.isHidden = true
//                    } else {
//                        self?.cityLabel.text = locatinName
//                        self?.temperatureLabel.text = "\(temperature!)"
//
//                        self?.temperatureLabel.isHidden = false
//                    }
//                }
//
//            } catch let jsonError {
//                print(jsonError)
//            }
//        }
//
//        task.resume()
//    }
//}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
