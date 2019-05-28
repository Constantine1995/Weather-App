//
//  WeatherViewController+Extension.swift
//  Weather-App
//
//  Created by mac on 5/28/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

extension WeatherViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
