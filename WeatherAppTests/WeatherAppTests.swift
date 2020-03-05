//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Testcase for WeathersVM.loadWeatherList, using WeatherServiceStub.
    func testWeathersVM() {
        let ds = GenericDataSource<DailyWeatherVM>()
        let serviceStub = WeatherServiceStub()
        let weathersVm = WeatherListVM(ds: ds, weatherService: serviceStub)
        weathersVm.loadWeatherList()
        XCTAssert(serviceStub.didCalledGetForecastWeather)
        
        if weathersVm.dailyWeathersDs.data.value.count == 0 {
            XCTFail()
        }
        let dailyWeather = weathersVm.dailyWeathersDs.data.value[0]
        if dailyWeather.hourWeathers.data.value.count == 0 {
            XCTFail()
        }
        let hourlyWeather = dailyWeather.hourWeathers.data.value[0]
        let firstTemp = (295.14-273.15).roundAndInt()
        XCTAssert(hourlyWeather.tempLabel == "\(firstTemp)°C")
    }
    
    /// Testcase for DailyWeatherVM initializer.
    func testDailyWeatherVM() {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let weatherDetail = WeatherDetail(currentTemperature: WeatherTemperature(actualTemp: 298.15),
                                          weatherIcon: .init(), currentDay: df.string(from: Date()))
        let dayWeather = DailyWeatherVM(weather: weatherDetail)
        guard dayWeather.hourWeathers.data.value.count == 0 else {
            XCTFail()
            return
        }
        XCTAssert(dayWeather.dayLabel == "Today")
    }
    
    /// Testcase for HourlyWeatherVM initializer.
    func testHourlyWeatherVM() {
        let df = DateFormatter()
        var date = Date()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        df.timeZone = TimeZone.ReferenceType.local
        let dateStr = df.string(from: date)
        df.timeZone = TimeZone(abbreviation: "UTC")
        date = df.date(from: dateStr)!
        
        let temp = 298.15
        let weatherDetail = WeatherDetail(currentTemperature: WeatherTemperature(actualTemp: temp),
                                          weatherIcon: .init(), currentDay: df.string(from: date))
        let imageService = ImageBackendService()
        let dayWeather = HourlyWeatherVM(weather: weatherDetail, imageService: imageService, dialogAlertVm: DialogAlertVM())
        df.dateFormat = "h:mm a"
        df.timeZone = TimeZone.ReferenceType.local
        XCTAssert(dayWeather.hourLabel == df.string(from: date))
        XCTAssert(dayWeather.tempLabel == "\((temp-273.15).roundAndInt())°C")
    }

    func testPerformance() {
        // This is an example of a performance test case.
        self.measure {
            testWeathersVM()
            testDailyWeatherVM()
            testHourlyWeatherVM()
        }
    }

}
