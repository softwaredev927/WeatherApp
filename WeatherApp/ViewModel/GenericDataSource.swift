//
//  GenericDataSource.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// GenericDataSource object to observe list data.
class GenericDataSource<T>: NSObject {
    var data: Observer <[T]> = Observer ([])
}
