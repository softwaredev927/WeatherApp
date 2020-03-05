//
//  URLSession+.swift
//  WeatherApp
//
//  Created by Admin on 16/07/2019.
//  Copyright © 2019 Creative. All rights reserved.
//

import Foundation

extension URLSession {
    
    /// Get data using dataTask.
    /// - parameter from: url to get data.
    /// - parameter completion: completion handler.
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        dataTask(with: url, completionHandler: completion).resume()
    }
}
