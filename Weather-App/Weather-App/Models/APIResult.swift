//
//  APIResult.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case Succes(T)
    case Failure(Error)
}
