//
//  ServiceError.swift
//  WeatherApp
//
//  Created by Longzhu on 16/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Customized Service Error.
enum ServiceError: Error {
    
    /// Service URL is invalid.
    case invalidURL
    
    /// No data available from provided URL.
    case noDataAvailable
    
    /// Internal error of service.
    case serviceErrror
    
    /// Response parsing error.
    case invalidResponse
}
