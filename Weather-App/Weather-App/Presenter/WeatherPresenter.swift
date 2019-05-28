//
//  WeatherPresenter.swift
//  Weather-App
//
//  Created by mac on 5/28/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

class WeatherPresenter {
    
    weak var viewDelegate: WeatherViewDelegate?
    lazy var weatherManager = APIWeatherManager(apiKey: Constant.apiKey)
    
    func getData(with coordinates: Coordinates) {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { result in
            switch result {
            case .Succes(let currentWeather):
                self.viewDelegate?.displayWeather(currentWeather)
            case .Failure(let error as NSError):
                self.viewDelegate?.displayError(message: "Unable to get data \(error.localizedDescription)")
            default: break
            }
        }
    }
}
