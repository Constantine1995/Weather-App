//
//  APIManagerProtocol.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

protocol APIManagerProtocol {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
//    func JSONTaskWith(request: URLRequest, completionHandler: JSONCompletionHandler) -> JSONTask
    func fetch<T: JSONDecodable>(request: URLRequest, parse: @escaping ([String: AnyObject]?) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
}
