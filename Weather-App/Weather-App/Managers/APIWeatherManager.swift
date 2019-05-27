//
//  APIWeatherManager.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


final class APIWeatherManager: APIManagerProtocol {
//    func JSONTaskWith(request: URLRequest, completionHandler: ([String : AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> JSONTask {
//        completionHandler(nil, nil, nil)
//    }
//    

    
    let sessionConfiguration: URLSessionConfiguration
    
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    }()
    
    let apiKey: String
    
    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
        self.sessionConfiguration = sessionConfiguration
        self.apiKey = apiKey
    }
    
    convenience init(apiKey: String) {
        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
    }
    
    func fetchCurrentWeatherWith(coordinates: Coordinates, completionHandler: @escaping (APIResult<CurrentWeather>) -> Void) {
        let request = ForecastType.Current(apiKey: self.apiKey, coordinates: coordinates).request
        fetch(request: request, parse: { (json) -> CurrentWeather? in
            if let dictionary = json!["currently"] as? [String: AnyObject] {
                return CurrentWeather(JSON: dictionary)
            } else { return nil }
        }, completionHandler: completionHandler)
    }
}
