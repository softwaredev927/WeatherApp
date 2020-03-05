//
//  ForecastWeatherInfo.swift
//  ForecasxtWeatherApp
//
//  Created by Longzhu on 13/07/19.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Model object for **WeatherList**, mapped to response of API Service.
struct WeatherListModel: Codable {
    
    /// List of weather detail, each deail contains for a certain hour's weather detail.
    let list: [WeatherDetail]
}
