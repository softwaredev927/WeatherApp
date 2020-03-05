//
//  WeatherService.swift
//  WeatherApp
//
//
//  Modified by Longzhu on 13/07/19.
//  Copyright © 2019 Longzhu. All rights reserved.

import Foundation

/// Protocol for Weatcher Service.
protocol WeatherService {
    
    /// Completion handler with success value of WeatherListModel and error.
    typealias CompletionForecast = (Result<WeatherListModel, Error>) -> Void
    
    /// Fetch forecast weather by cityId.
    /// - parameter by: id of city to fech weathers.
    /// - parameter completion: completion handler.
    func getForecastWeather(by cityId: Int, completion: @escaping CompletionForecast)
}

/// Implemantion of Weather Service protocol.
class WeatherBackendService: WeatherService {
    
    /// OpenWeatherMap Service Endpoint.
    var apiEndpoint = "https://api.openweathermap.org/data/2.5"
    /// API Key of OpenWeatherMap Service.
    var apiKey = "a3d65b0a2e7c04292d49965360f1de00"
    
    /// Fetch forecast weathers from openweathermap.
    /// - parameter by: fetch weathers of the city with this id.
    /// - parameter completion: completion handler.
    func getForecastWeather(by cityId: Int, completion: @escaping CompletionForecast) {
        let url = "\(apiEndpoint)/forecast?id=\(cityId)&appid=\(apiKey)"
        
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        guard let stringURL = URL(string: urlString ?? "") else {
            print("No valid url")
            return
        }
        
        let session = URLSession.shared
        let task = session.downloadTask(with: stringURL, completionHandler: {
            (dataUrl: URL?, response: URLResponse?, error: Error?) -> Void
            in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let dataUrl = dataUrl,
                let weatherData = try? Data(contentsOf: dataUrl) else {
                    DispatchQueue.main.async {
                        completion(.failure(ServiceError.noDataAvailable))
                    }
                    return
            }

            do {
                let weatherInfo = try JSONDecoder().decode(WeatherListModel.self, from: weatherData)

                DispatchQueue.main.async {
                    let result = Result<WeatherListModel, Error>.success(weatherInfo)
                    completion(result)
                }
            } catch(let error) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        })
        task.resume()
    }
}
