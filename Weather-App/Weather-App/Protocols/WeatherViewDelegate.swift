//
//  WeatherViewDelegate.swift
//  Weather-App
//
//  Created by mac on 5/28/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherViewDelegate: class {
    func displayWeather(_ description: CurrentWeather)
    func displayError(message: String)
}
