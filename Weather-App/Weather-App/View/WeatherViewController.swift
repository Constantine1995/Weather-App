//
//  ViewController.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewDelegate {
    
    var presenter = WeatherPresenter()
    
    let coordinates = Coordinates(latitude: 46.830290, longitude: 35.424191)
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 30)
        label.text = "Melitopol"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
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
        label.font = UIFont.systemFont(ofSize: 100, weight: .ultraLight)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let apparentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.setTitle("Refresh", for: .normal)
        button.tintColor = #colorLiteral(red: 0.6745098039, green: 0.8732770085, blue: 0.9054248929, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setShadow()
        button.addTarget(self, action: #selector(refreshActionButton(_ :)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDelegate = self
        
        view.addSubview(locationLabel)
        view.addSubview(weatherIconImageView)
        view.addSubview(stackView)
        view.addSubview(temperatureLabel)
        view.addSubview(apparentTemperatureLabel)
        view.addSubview(refreshButton)
        
        setupView()
        
        presenter.getData(with: coordinates)
    }
    
    func displayWeather(_ description: CurrentWeather) {
        weatherIconImageView.image = description.icon
        pressureLabel.text = description.pressureString
        temperatureLabel.text = description.temperatureString
        humidityLabel.text = description.humidityString
        apparentTemperatureLabel.text = description.appearentTemperatureString
    }
    
    func displayError(message: String) {
        showAlert(title: "Weater-App", message: message)
        
        locationLabel.text = ""
        weatherIconImageView.image = #imageLiteral(resourceName: "no-image")
        pressureLabel.text = ""
        temperatureLabel.text = ""
        humidityLabel.text = ""
        apparentTemperatureLabel.text = ""
    }
    
    fileprivate func setupView() {
        
        locationLabel.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 15, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
        locationLabel.setCenterXAnchor(view)
        
        weatherIconImageView.setAnchor(top: locationLabel.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 180, height: 180)
        weatherIconImageView.setCenterXAnchor(locationLabel)
        
        stackView.setAnchor(top: weatherIconImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 30, paddingLeft: 10, paddingRight: -10, paddingBottom: 0, width: view.frame.width, height: 50)
        
        temperatureLabel.setAnchor(top: weatherIconImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: apparentTemperatureLabel.topAnchor, paddingTop: 70, paddingLeft: 10, paddingRight: -10, paddingBottom: -10)
        
        apparentTemperatureLabel.setAnchor(top: temperatureLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 25, paddingLeft: 10, paddingRight: -10, paddingBottom: 0)
        
        refreshButton.setAnchor(top: nil, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 120, paddingRight: -120, paddingBottom: -20, width: 50, height: 40)
        
        refreshButton.setCenterXAnchor(view)
    }
    
    @objc func refreshActionButton(_ : UIButton) {
        presenter.getData(with: coordinates)
    }
}

