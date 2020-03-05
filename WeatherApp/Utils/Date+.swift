//
//  Date+.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

extension Date {
    
    /// **Compare day** between self and parameter date.
    /// - parameter date: to compare with self.
    /// - returns: ComparisonResult object.
    func compareDay(_ date: Date) -> ComparisonResult {
        return Calendar.current.compare(self, to: date, toGranularity: .day)
    }
    
    /// Get hour string formatted **h:mm a** of self date.
    /// - returns: String object formatted for hour.
    func displayHour() -> String {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        df.timeZone = TimeZone.ReferenceType.local
        return df.string(from: self)
    }
    
    /// Return next day of self date.
    /// - returns: Date object of next day.
    func nextDay() -> Date {
        return self.addingTimeInterval(24 * 3600)
    }
    
    /// Convert self utc date to local.
    /// - returns: Date object converted into local from utc.
    func toLocal() -> Date {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM:dd HH:mm:ss"
        df.timeZone = TimeZone(abbreviation: "UTC")
        let str = df.string(from: self)
        df.dateFormat = "yyyy-MM:dd HH:mm:ss"
        df.timeZone = TimeZone.ReferenceType.local
        return df.date(from: str)!
    }

    /// Convert self local date to utc.
    /// - returns: Date object converted into local from utc.
    func toGlobal() -> Date {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM:dd HH:mm:ss"
        df.timeZone = TimeZone.ReferenceType.local
        let str = df.string(from: self)
        df.dateFormat = "yyyy-MM:dd HH:mm:ss"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df.date(from: str)!
    }
}
