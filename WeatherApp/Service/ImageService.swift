//
//  ImageService.swift
//  WeatherApp
//
//  Created by Longzhu on 16/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation
import UIKit

/// Protocol for Image Service.
protocol ImageService {
    
    /// Completion handler with success value of UIImage and error.
    typealias CompletionDownload = (Result<UIImage, Error>) -> Void
    
    /// Download image by url.
    /// - parameter by: url of image in string.
    /// - parameter completion: completion handler.
    func downloadImage(by urlStr: String, completion: @escaping CompletionDownload)
}

/// Implemantion of ImageService protocol.
class ImageBackendService: ImageService {
    
    /// Image cache.
    var imageCache = ImageCache()
    
    /// Download image by url.
    /// - parameter by: url of image in string.
    /// - parameter completion: completion handler.
    func downloadImage(by urlStr: String, completion: @escaping CompletionDownload) {
        /// Search from cache.
        if let image = imageCache.get(urlStr) {
            completion(.success(image))
            return
        }
        guard let url = URL.init(string: urlStr) else {
            completion(.failure(ServiceError.invalidURL))
            return
        }
        /// If not exist in cache, fetch again.
        URLSession.shared.getData(from: url) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.noDataAvailable))
                }
                return
            }
            guard let image = UIImage(data: data) else {
                completion(.failure(ServiceError.invalidResponse))
                return
            }
            guard let weakSelf = self else {
                completion(.failure(ServiceError.serviceErrror))
                return
            }

            weakSelf.imageCache.add(urlStr, image: image)
            completion(.success(image))
        }
    }
}
