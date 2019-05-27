//
//  JSONDecodable.swift
//  Weather-App
//
//  Created by mac on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init?(JSON: [String: AnyObject])
}
