//
//  HourWeatherVM.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation
import UIKit

//  View Model Object for a **certain hour**'s weather.
class HourlyWeatherVM {
    
    /// Hour label formatting time as **h:mm a**.
    var hourLabel = ""
    
    /// Weather Icon Observable.
    var weatherIcon = Observer<UIImage?>(nil)
    
    /// Temperature Label.
    var tempLabel = ""
    
    var imageService: ImageService!
    
    weak var dialogAlertVm: DialogAlertVM!
    
    /// Initialize by weather detail.
    /// - parameter weather: a certain weather detail fetched from service.
    /// - parameter imageService: image service to fetch weather icons.
    /// - parameter dialogAlertVm: dialog alert view model to show when image for icon fetch failed.
    init(weather: WeatherDetail, imageService: ImageService!, dialogAlertVm: DialogAlertVM!) {
        self.imageService = imageService
        self.dialogAlertVm = dialogAlertVm
        showHourlyWeather(weather: weather)
    }
    
    /// Show hourly weather by weather detail.
    /// - parameter weather: a certain weather detail fetched from service.
    func showHourlyWeather(weather: WeatherDetail) {
        let dateFormatter = DateFormatter()
        guard let hour = dateFormatter.dateFromNormal(weather.currentDay) else {
            return
        }
        // Convert date/time format to hour.
        hourLabel = hour.displayHour()
        imageService.downloadImage(by: weather.iconUrlPath) { [weak self] res in
            guard let weakSelf = self else { return }
            
            switch(res) {
            case .success(let image):
                weakSelf.weatherIcon.value = image
                break
            case .failure(let error):
                weakSelf.dialogAlertVm.title = "Weather icon loading failed"
                weakSelf.dialogAlertVm.description = "Error description: \(error.localizedDescription)"
                weakSelf.dialogAlertVm.showOrHide.value = true
                break
            }
        }
        // Convert temperature from Fahrenheit to Celsius.
        tempLabel = "\(weather.displayTemperature)°C"
    }
}
