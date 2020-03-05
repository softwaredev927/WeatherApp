//
//  DayWeatherVM.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

//  View Model Object for a **certain day**'s weather.
class DailyWeatherVM {
    
    /// Day Label, ex: Today, Tomorrow, MMM d.
    var dayLabel: String = ""
    
    /// Week Label, ex: Monday, ...
    var weekLabel: String = ""
    
    /// WeatherVM for hours
    var hourWeathers = GenericDataSource<HourlyWeatherVM>()
    
    /// Initialize by weather detail.
    /// - parameter weather: a certain weather detail fetched from service.
    init(weather: WeatherDetail) {
        showDailyWether(weather: weather)
    }
    
    /// Show and initialize view model by weather detail.
    /// - parameter weather: a certain weather detail fetched from service.
    func showDailyWether(weather: WeatherDetail) {
        let df = DateFormatter()
        guard let day = df.dateFromNormal(weather.currentDay) else {
            return
        }
        if Date().compareDay(day.toLocal()) == .orderedSame {
            dayLabel = "Today"
        } else if Date().nextDay().compareDay(day.toLocal()) == .orderedSame {
            dayLabel = "Tomorrow"
        } else {
            df.dateFormat = "MMM d"
            dayLabel = df.string(from: day)
        }
        weekLabel = df.weekDayLabel(date: day)
    }
}
