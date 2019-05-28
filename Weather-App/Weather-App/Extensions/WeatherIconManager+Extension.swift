//
//  WeatherIconManager+Extension.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//
import UIKit

extension WeatherIconManager {
   
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
