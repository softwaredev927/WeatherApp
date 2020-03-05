//
//  ImageCache.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// ImageCache Object for images with key of string.
class ImageCache {
    
    /// Cache for images with string key.
    var cache = [(String, UIImage)].init()
    
    /// Return image in the cache.
    /// - parameter : image key such as url.
    func get(_ key: String) -> UIImage? {
        if let icon = cache.first(where: { $0.0 == key} ) {
            return icon.1
        }
        return nil //return UIImage.init(named: "TempIcon")
    }
    
    /// Add image to the cache.
    /// - parameter : key of image.
    /// - parameter image: image to be added.
    func add(_ key: String, image: UIImage) {
        cache.append((key, image))
    }
    
    /// Clear cache.
    func clearCache() {
        cache.removeAll()
    }
    
    /// Destroy cache.
    deinit {
        clearCache()
    }
}
