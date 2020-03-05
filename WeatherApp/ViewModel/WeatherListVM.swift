//
//  WeatherVM.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

//  View Model Object for **weathers**.
class WeatherListVM {
    
    /// WeatherService Protocol to fetch weather list.
    var weatherService: WeatherService!
    
    /// ImageService to download weather icons.
    var imageService: ImageService!
    
    /// City name to display on screen.
    var cityName = "Munich"
    
    /// City temperature now.
    var cityTemp = " loading failed"
    
    /// All weathers fetched from service.
    weak var dailyWeathersDs: GenericDataSource<DailyWeatherVM>!
    
    /// Status whether weathers loading(true) or finished.
    var isLoading = Observer(true)
    
    /// DialogAlert viewmodel to show alert when fetch failed.
    var dialogAlertVm = DialogAlertVM()
    
    //  Initialize with GenericDataSource.
    init(ds: GenericDataSource<DailyWeatherVM>, weatherService: WeatherService! = WeatherBackendService()) {
        self.dailyWeathersDs = ds
        self.weatherService = weatherService
        self.imageService = ImageBackendService()
        // Load weathers from service.
        self.loadWeatherList()
    }
    
    /// Fill variables by fetched weatherList from Service.
    /// - parameter by: weather list model fetched from service.
    func showWeatherList(by weatherList: WeatherListModel) {
        var lastDay = Date()
        let dateFormatter = DateFormatter()
        // Loop all weather details.
        var dayWeathers = [DailyWeatherVM].init()
        var hourWeathers = [HourlyWeatherVM].init()
        for weather in weatherList.list {
            guard let day = dateFormatter.dateFromNormal(weather.currentDay) else {
                continue
            }
            if dailyWeathersDs.data.value.count == 0 {
                cityTemp = "\(weather.displayTemperature)°C"
            }
            // Add DayWeatherVM if today or next day.
            if dayWeathers.count == 0 || lastDay.compareDay(day) == .orderedAscending {
                if dayWeathers.count > 0 {
                    // Add hour weathers for last day.
                    dayWeathers[dayWeathers.count-1].hourWeathers.data.value = hourWeathers
                }
                // Add DayWeatherVM for day
                dayWeathers.append(DailyWeatherVM(weather: weather))
                lastDay = day
                hourWeathers.removeAll()
            }
            // Add HourWeatherVM to last DayWeatherVM.
            hourWeathers.append(HourlyWeatherVM(weather: weather, imageService: imageService, dialogAlertVm: dialogAlertVm))
        }
        dayWeathers[dayWeathers.count-1].hourWeathers.data.value = hourWeathers
        self.dailyWeathersDs.data.value = dayWeathers
    }
    
    /// Fetch weather list from WeatherService.
    func loadWeatherList() {
        isLoading.value = true
        
        weatherService.getForecastWeather(by: 2867714, completion: { [weak self] res in
            guard let weakSelf = self else { return }
            switch res {
            case .success(let weatherList):
                weakSelf.showWeatherList(by: weatherList)
                weakSelf.isLoading.value = false
                break
            case .failure(let error):
                weakSelf.dialogAlertVm.title = "Failed fetching weathers"
                weakSelf.dialogAlertVm.description = "Error description: \(error.localizedDescription)"
                weakSelf.isLoading.value = false
                weakSelf.dialogAlertVm.showOrHide.value = true
                break
            }
        })
    }
}
