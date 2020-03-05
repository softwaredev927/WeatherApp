//
//  Double+.swift
//  WeatherApp
//
//  Created by Admin on 16/07/2019.
//  Copyright © 2019 Creative. All rights reserved.
//

import Foundation

extension Double {
    
    /// Return rounded and converted as Int.
    func roundAndInt() -> Int {
        return Int(self.rounded())
    }
}
