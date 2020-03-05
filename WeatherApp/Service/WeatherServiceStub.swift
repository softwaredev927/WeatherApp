//
//  WeatherServiceStub.swift
//  WeatherAppTests
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Test Stub for classes using WeatherService Protocol.
class WeatherServiceStub: WeatherService {
    
    /// Flag whether called getForecastWeather method.
    var didCalledGetForecastWeather = false
    
    func getForecastWeather(by cityId: Int, completion: @escaping CompletionForecast) {
        didCalledGetForecastWeather = true
        do {
            let decorder = JSONDecoder.init()
            let weatherInfo = try decorder.decode(WeatherListModel.self, from: jsonStr.data(using: .utf8)!)
            completion(Result<WeatherListModel, Error>.success(weatherInfo))
        } catch(let error) {
            completion(Result<WeatherListModel, Error>.failure(error))
        }
    }
    
    /// Return weather list from test data.
    func getWeatherList() -> WeatherListModel? {
        didCalledGetForecastWeather = true
        
        do {
            let decorder = JSONDecoder.init()
            let weatherInfo = try decorder.decode(WeatherListModel.self, from: jsonStr.data(using: .utf8)!)
            return weatherInfo
        } catch(_) {
            return nil
        }
    }
    
    /// Test service response.
    var jsonStr = "{\"cod\":\"200\",\"message\":0.0103,\"cnt\":40,\"list\":[{\"dt\":1563192000,\"main\":{\"temp\":295.14,\"temp_min\":293.502,\"temp_max\":295.14,\"pressure\":1014.13,\"sea_level\":1014.13,\"grnd_level\":960.33,\"humidity\":61,\"temp_kf\":1.64},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":47},\"wind\":{\"speed\":2.6,\"deg\":53.461},\"rain\":{\"3h\":0.313},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-15 12:00:00\"},{\"dt\":1563202800,\"main\":{\"temp\":296.23,\"temp_min\":295,\"temp_max\":296.23,\"pressure\":1013.61,\"sea_level\":1013.61,\"grnd_level\":959.49,\"humidity\":55,\"temp_kf\":1.23},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.32,\"deg\":12.545},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-15 15:00:00\"},{\"dt\":1563213600,\"main\":{\"temp\":291.82,\"temp_min\":291,\"temp_max\":291.82,\"pressure\":1014.7,\"sea_level\":1014.7,\"grnd_level\":960.1,\"humidity\":80,\"temp_kf\":0.82},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":1},\"wind\":{\"speed\":3.47,\"deg\":322.869},\"rain\":{\"3h\":0.313},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-15 18:00:00\"},{\"dt\":1563224400,\"main\":{\"temp\":287.35,\"temp_min\":286.939,\"temp_max\":287.35,\"pressure\":1016.53,\"sea_level\":1016.53,\"grnd_level\":960.98,\"humidity\":88,\"temp_kf\":0.41},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10n\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.51,\"deg\":304.102},\"rain\":{\"3h\":0.062},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-15 21:00:00\"},{\"dt\":1563235200,\"main\":{\"temp\":285.4,\"temp_min\":285.4,\"temp_max\":285.4,\"pressure\":1017.44,\"sea_level\":1017.44,\"grnd_level\":961.38,\"humidity\":92,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.78,\"deg\":306.824},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-16 00:00:00\"},{\"dt\":1563246000,\"main\":{\"temp\":283.966,\"temp_min\":283.966,\"temp_max\":283.966,\"pressure\":1017.38,\"sea_level\":1017.38,\"grnd_level\":961.33,\"humidity\":95,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.63,\"deg\":295.135},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-16 03:00:00\"},{\"dt\":1563256800,\"main\":{\"temp\":286.839,\"temp_min\":286.839,\"temp_max\":286.839,\"pressure\":1017.65,\"sea_level\":1017.65,\"grnd_level\":962.23,\"humidity\":90,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.79,\"deg\":290.308},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-16 06:00:00\"},{\"dt\":1563267600,\"main\":{\"temp\":291.5,\"temp_min\":291.5,\"temp_max\":291.5,\"pressure\":1017.09,\"sea_level\":1017.09,\"grnd_level\":962.5,\"humidity\":71,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":3.42,\"deg\":304.712},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-16 09:00:00\"},{\"dt\":1563278400,\"main\":{\"temp\":293.863,\"temp_min\":293.863,\"temp_max\":293.863,\"pressure\":1016.12,\"sea_level\":1016.12,\"grnd_level\":962.01,\"humidity\":63,\"temp_kf\":0},\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02d\"}],\"clouds\":{\"all\":21},\"wind\":{\"speed\":4.58,\"deg\":300.597},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-16 12:00:00\"},{\"dt\":1563289200,\"main\":{\"temp\":294.132,\"temp_min\":294.132,\"temp_max\":294.132,\"pressure\":1015.56,\"sea_level\":1015.56,\"grnd_level\":961.54,\"humidity\":62,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":4.16,\"deg\":302.979},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-16 15:00:00\"},{\"dt\":1563300000,\"main\":{\"temp\":291.742,\"temp_min\":291.742,\"temp_max\":291.742,\"pressure\":1016.18,\"sea_level\":1016.18,\"grnd_level\":961.52,\"humidity\":77,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":2.56,\"deg\":309.299},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-16 18:00:00\"},{\"dt\":1563310800,\"main\":{\"temp\":286.559,\"temp_min\":286.559,\"temp_max\":286.559,\"pressure\":1017.82,\"sea_level\":1017.82,\"grnd_level\":962.42,\"humidity\":87,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":1.26,\"deg\":321.511},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-16 21:00:00\"},{\"dt\":1563321600,\"main\":{\"temp\":284.987,\"temp_min\":284.987,\"temp_max\":284.987,\"pressure\":1017.54,\"sea_level\":1017.54,\"grnd_level\":962.04,\"humidity\":85,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"clouds\":{\"all\":0},\"wind\":{\"speed\":0.54,\"deg\":309.222},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-17 00:00:00\"},{\"dt\":1563332400,\"main\":{\"temp\":284.185,\"temp_min\":284.185,\"temp_max\":284.185,\"pressure\":1016.62,\"sea_level\":1016.62,\"grnd_level\":961.12,\"humidity\":87,\"temp_kf\":0},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"clouds\":{\"all\":37},\"wind\":{\"speed\":0.82,\"deg\":247.681},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-17 03:00:00\"},{\"dt\":1563343200,\"main\":{\"temp\":288.015,\"temp_min\":288.015,\"temp_max\":288.015,\"pressure\":1015.74,\"sea_level\":1015.74,\"grnd_level\":960.84,\"humidity\":80,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"clouds\":{\"all\":59},\"wind\":{\"speed\":0.93,\"deg\":319.713},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-17 06:00:00\"},{\"dt\":1563354000,\"main\":{\"temp\":293.4,\"temp_min\":293.4,\"temp_max\":293.4,\"pressure\":1014.37,\"sea_level\":1014.37,\"grnd_level\":960.33,\"humidity\":65,\"temp_kf\":0},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"clouds\":{\"all\":4},\"wind\":{\"speed\":0.92,\"deg\":300.063},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-17 09:00:00\"},{\"dt\":1563364800,\"main\":{\"temp\":295.3,\"temp_min\":295.3,\"temp_max\":295.3,\"pressure\":1012.99,\"sea_level\":1012.99,\"grnd_level\":959.33,\"humidity\":56,\"temp_kf\":0},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"clouds\":{\"all\":45},\"wind\":{\"speed\":2.62,\"deg\":323.807},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-17 12:00:00\"},{\"dt\":1563375600,\"main\":{\"temp\":295.861,\"temp_min\":295.861,\"temp_max\":295.861,\"pressure\":1012.14,\"sea_level\":1012.14,\"grnd_level\":958.26,\"humidity\":56,\"temp_kf\":0},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],\"clouds\":{\"all\":100},\"wind\":{\"speed\":2.33,\"deg\":310.897},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-17 15:00:00\"},{\"dt\":1563386400,\"main\":{\"temp\":292.812,\"temp_min\":292.812,\"temp_max\":292.812,\"pressure\":1012.64,\"sea_level\":1012.64,\"grnd_level\":957.95,\"humidity\":72,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"clouds\":{\"all\":83},\"wind\":{\"speed\":2.35,\"deg\":279.27},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-17 18:00:00\"},{\"dt\":1563397200,\"main\":{\"temp\":288.6,\"temp_min\":288.6,\"temp_max\":288.6,\"pressure\":1013.75,\"sea_level\":1013.75,\"grnd_level\":958.64,\"humidity\":81,\"temp_kf\":0},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"clouds\":{\"all\":33},\"wind\":{\"speed\":1.72,\"deg\":300.031},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-17 21:00:00\"},{\"dt\":1563408000,\"main\":{\"temp\":287.378,\"temp_min\":287.378,\"temp_max\":287.378,\"pressure\":1013.45,\"sea_level\":1013.45,\"grnd_level\":958.29,\"humidity\":87,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":67},\"wind\":{\"speed\":1.71,\"deg\":249.945},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-18 00:00:00\"},{\"dt\":1563418800,\"main\":{\"temp\":286.9,\"temp_min\":286.9,\"temp_max\":286.9,\"pressure\":1012.81,\"sea_level\":1012.81,\"grnd_level\":957.63,\"humidity\":90,\"temp_kf\":0},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":100},\"wind\":{\"speed\":2.19,\"deg\":234.86},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-18 03:00:00\"},{\"dt\":1563429600,\"main\":{\"temp\":289.1,\"temp_min\":289.1,\"temp_max\":289.1,\"pressure\":1012.51,\"sea_level\":1012.51,\"grnd_level\":957.69,\"humidity\":88,\"temp_kf\":0},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],\"clouds\":{\"all\":100},\"wind\":{\"speed\":2.92,\"deg\":234.635},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-18 06:00:00\"},{\"dt\":1563440400,\"main\":{\"temp\":293.839,\"temp_min\":293.839,\"temp_max\":293.839,\"pressure\":1012.01,\"sea_level\":1012.01,\"grnd_level\":957.65,\"humidity\":72,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":100},\"wind\":{\"speed\":3.39,\"deg\":281.018},\"rain\":{\"3h\":2.062},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-18 09:00:00\"},{\"dt\":1563451200,\"main\":{\"temp\":294.622,\"temp_min\":294.622,\"temp_max\":294.622,\"pressure\":1011.39,\"sea_level\":1011.39,\"grnd_level\":957.42,\"humidity\":67,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":93},\"wind\":{\"speed\":3.45,\"deg\":288.482},\"rain\":{\"3h\":1.876},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-18 12:00:00\"},{\"dt\":1563462000,\"main\":{\"temp\":295.461,\"temp_min\":295.461,\"temp_max\":295.461,\"pressure\":1011.44,\"sea_level\":1011.44,\"grnd_level\":956.86,\"humidity\":59,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":55},\"wind\":{\"speed\":3.8,\"deg\":277.282},\"rain\":{\"3h\":0.625},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-18 15:00:00\"},{\"dt\":1563472800,\"main\":{\"temp\":292.022,\"temp_min\":292.022,\"temp_max\":292.022,\"pressure\":1012.63,\"sea_level\":1012.63,\"grnd_level\":958.09,\"humidity\":79,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":35},\"wind\":{\"speed\":2.61,\"deg\":272.719},\"rain\":{\"3h\":1.375},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-18 18:00:00\"},{\"dt\":1563483600,\"main\":{\"temp\":288.679,\"temp_min\":288.679,\"temp_max\":288.679,\"pressure\":1014.2,\"sea_level\":1014.2,\"grnd_level\":958.96,\"humidity\":81,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":77},\"wind\":{\"speed\":2.59,\"deg\":221.545},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-18 21:00:00\"},{\"dt\":1563494400,\"main\":{\"temp\":286.908,\"temp_min\":286.908,\"temp_max\":286.908,\"pressure\":1014.35,\"sea_level\":1014.35,\"grnd_level\":959.02,\"humidity\":89,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10n\"}],\"clouds\":{\"all\":81},\"wind\":{\"speed\":3.78,\"deg\":228.098},\"rain\":{\"3h\":0.063},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-19 00:00:00\"},{\"dt\":1563505200,\"main\":{\"temp\":286.407,\"temp_min\":286.407,\"temp_max\":286.407,\"pressure\":1014.73,\"sea_level\":1014.73,\"grnd_level\":959.32,\"humidity\":92,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10n\"}],\"clouds\":{\"all\":98},\"wind\":{\"speed\":3.06,\"deg\":233.437},\"rain\":{\"3h\":0.625},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-19 03:00:00\"},{\"dt\":1563516000,\"main\":{\"temp\":289.246,\"temp_min\":289.246,\"temp_max\":289.246,\"pressure\":1015.3,\"sea_level\":1015.3,\"grnd_level\":960.19,\"humidity\":87,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":75},\"wind\":{\"speed\":3.88,\"deg\":260.489},\"rain\":{\"3h\":0.063},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-19 06:00:00\"},{\"dt\":1563526800,\"main\":{\"temp\":293.5,\"temp_min\":293.5,\"temp_max\":293.5,\"pressure\":1015.21,\"sea_level\":1015.21,\"grnd_level\":960.86,\"humidity\":74,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":30},\"wind\":{\"speed\":3.63,\"deg\":278.005},\"rain\":{\"3h\":1.25},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-19 09:00:00\"},{\"dt\":1563537600,\"main\":{\"temp\":295.958,\"temp_min\":295.958,\"temp_max\":295.958,\"pressure\":1014.39,\"sea_level\":1014.39,\"grnd_level\":960.21,\"humidity\":62,\"temp_kf\":0},\"weather\":[{\"id\":500,\"main\":\"Rain\",\"description\":\"light rain\",\"icon\":\"10d\"}],\"clouds\":{\"all\":18},\"wind\":{\"speed\":3.52,\"deg\":278.75},\"rain\":{\"3h\":0.625},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-19 12:00:00\"},{\"dt\":1563548400,\"main\":{\"temp\":296.542,\"temp_min\":296.542,\"temp_max\":296.542,\"pressure\":1014.49,\"sea_level\":1014.49,\"grnd_level\":960.19,\"humidity\":59,\"temp_kf\":0},\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02d\"}],\"clouds\":{\"all\":16},\"wind\":{\"speed\":3.06,\"deg\":292.055},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-19 15:00:00\"},{\"dt\":1563559200,\"main\":{\"temp\":293.419,\"temp_min\":293.419,\"temp_max\":293.419,\"pressure\":1015.46,\"sea_level\":1015.46,\"grnd_level\":960.74,\"humidity\":75,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"clouds\":{\"all\":58},\"wind\":{\"speed\":1.67,\"deg\":310.531},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-19 18:00:00\"},{\"dt\":1563570000,\"main\":{\"temp\":289.6,\"temp_min\":289.6,\"temp_max\":289.6,\"pressure\":1016.95,\"sea_level\":1016.95,\"grnd_level\":961.79,\"humidity\":83,\"temp_kf\":0},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":97},\"wind\":{\"speed\":0.37,\"deg\":244.129},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-19 21:00:00\"},{\"dt\":1563580800,\"main\":{\"temp\":288.769,\"temp_min\":288.769,\"temp_max\":288.769,\"pressure\":1016.99,\"sea_level\":1016.99,\"grnd_level\":961.74,\"humidity\":86,\"temp_kf\":0},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":99},\"wind\":{\"speed\":0.56,\"deg\":180.305},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-20 00:00:00\"},{\"dt\":1563591600,\"main\":{\"temp\":287.566,\"temp_min\":287.566,\"temp_max\":287.566,\"pressure\":1016.54,\"sea_level\":1016.54,\"grnd_level\":961.34,\"humidity\":89,\"temp_kf\":0},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"clouds\":{\"all\":65},\"wind\":{\"speed\":1.17,\"deg\":150.419},\"sys\":{\"pod\":\"n\"},\"dt_txt\":\"2019-07-20 03:00:00\"},{\"dt\":1563602400,\"main\":{\"temp\":291.019,\"temp_min\":291.019,\"temp_max\":291.019,\"pressure\":1016.69,\"sea_level\":1016.69,\"grnd_level\":961.72,\"humidity\":81,\"temp_kf\":0},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"clouds\":{\"all\":46},\"wind\":{\"speed\":1.41,\"deg\":135.834},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-20 06:00:00\"},{\"dt\":1563613200,\"main\":{\"temp\":295.366,\"temp_min\":295.366,\"temp_max\":295.366,\"pressure\":1016.47,\"sea_level\":1016.47,\"grnd_level\":962.23,\"humidity\":68,\"temp_kf\":0},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"clouds\":{\"all\":32},\"wind\":{\"speed\":1.83,\"deg\":135.93},\"sys\":{\"pod\":\"d\"},\"dt_txt\":\"2019-07-20 09:00:00\"}],\"city\":{\"id\":2867714,\"name\":\"Muenchen\",\"coord\":{\"lat\":48.1374,\"lon\":11.5755},\"country\":\"DE\",\"timezone\":7200}}"
}
