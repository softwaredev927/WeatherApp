//
//  WeatherTemperature.swift
//  WeatherApp
//
//  Created by Longzhu on 16/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Model object for **Temperature**.
struct WeatherTemperature: Codable {
    
    /// Temperature for certain hour in kelvin as default.
    let actualTemp: Double
    
    private enum CodingKeys: String, CodingKey {
        case actualTemp = "temp"
    }
}
