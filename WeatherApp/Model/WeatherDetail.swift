//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Longzhu on 16/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Model object for **WeatherDetail**, each item of list in reponse fetched from service.
struct WeatherDetail {
    
    /// Temperature detail of certain hour.
    let currentTemperature: WeatherTemperature
    
    /// Icon list for a certain hour.
    let weatherIcon: [WeatherIcon]
    
    /// Time for this detail, formatted as **yyyy-MM-dd HH:mm:ss**.
    let currentDay: String
    
    private enum CodingKeys: String, CodingKey {
        case currentTemperature = "main", weatherIcon = "weather", currentDay = "dt_txt"
    }
}

extension WeatherDetail: Codable {
    
    /// Get full link for weather icon image.
    /// - returns: String object for full path of icon.
    var iconUrlPath: String {
        guard let iconName = weatherIcon.first?.icon else { return "" }
        return "https://openweathermap.org/img/w/\(iconName).png"
    }
    
    /// Get temperature in celsius.
    /// - returns: Int for tempature in celsius.
    var displayTemperature: Int {
        let value = (currentTemperature.actualTemp - 273.15).roundAndInt()
        return value
    }
}
