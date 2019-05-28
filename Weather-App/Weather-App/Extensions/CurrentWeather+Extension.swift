//
//  CurrentWeather-Extension.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

extension CurrentWeather: JSONDecodable {
    
    init?(JSON: [String : AnyObject]) {
        guard
            let temperature = JSON["temperature"] as? Double,
            let apparentTemperature = JSON["apparentTemperature"] as? Double,
            let humidity = JSON["humidity"] as? Double,
            let pressure = JSON["pressure"] as? Double,
            let iconString = JSON["icon"] as? String else { return nil }
        let icon = WeatherIconManager.init(rawValue: iconString)?.image
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.icon = icon!
    }
    
    var pressureString: String {
        return "\(Int(pressure * 0.750062)) mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity * 100)) %"
    }
    
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32))) ºC"
    }
    
    var appearentTemperatureString: String {
        return "Feels like: \(Int(5 / 9 * (apparentTemperature - 32))) ºC"
    }
}
