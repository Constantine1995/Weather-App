//
//  ViewController.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 25)
        label.text = "Melitopol"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [pressureLabel, humidityLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 20
        sv.distribution = .fillEqually
        return sv
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 75)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let appearentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var weatherManager = APIWeatherManager(apiKey: "55a266f7ba4e692310514bcba358d0f9")
    let coordinates = Coordinates(latitude: 46.830290, longitude: 35.424191)
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            switch result {
            case .Succes(let currentWeather):
                self.updateUIWith(currentWeather)
            case .Failure(let error as NSError):
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            default: break

            }
        }
        
        view.addSubview(locationLabel)
        view.addSubview(weatherIconImageView)
        view.addSubview(stackView)
        view.addSubview(temperatureLabel)
        view.addSubview(appearentTemperatureLabel)
        
        setupView()
        
//        let urlString = "https://api.darksky.net/forecast/55a266f7ba4e692310514bcba358d0f9/37.8267,-122.4233"
//        let baseURL = URL(string: "https://api.darksky.net/forecast/55a266f7ba4e692310514bcba358d0f9/")
//        let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
//        
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration)
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL) { (data, response, error) in
//            
//        }.resume()
    }
    
    func updateUIWith(_ currentWeather: CurrentWeather) {
        weatherIconImageView.image = currentWeather.icon
        pressureLabel.text = currentWeather.pressureString
        temperatureLabel.text = currentWeather.temperatureString
        humidityLabel.text = currentWeather.humidityString
        appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
    }
    
    fileprivate func setupView() {
        
        locationLabel.setAnchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 50, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
        locationLabel.setCenterXAnchor(view)
        
        weatherIconImageView.setAnchor(top: locationLabel.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 70, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
        weatherIconImageView.setCenterXAnchor(locationLabel)
        
        stackView.setAnchor(top: weatherIconImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 50, paddingLeft: 10, paddingRight: 10, paddingBottom: 0)
        
        temperatureLabel.setAnchor(top: stackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 50, paddingLeft: 10, paddingRight: 10, paddingBottom: 0)
        
        appearentTemperatureLabel.setAnchor(top: temperatureLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 30, paddingLeft: 10, paddingRight: 10, paddingBottom: 0)
    }
    
}

