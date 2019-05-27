//
//  CurrentWeather-Extension.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure)) mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity)) %"
    }
    
    var temperatureString: String {
        return "\(Int(temperature)) ºC"
    }
    
    var appearentTemperatureString: String {
        return "Feels like: \(Int(appearentTemperatur)) ºC"
    }
}
