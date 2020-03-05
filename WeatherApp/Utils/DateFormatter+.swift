//
//  DateFormatter+.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    /// Convert given string formated **yyyy-MM-dd hh:mm:ss** to date.
    /// - parameter str: String to be converted to date.
    /// - returns: String parsed from standard format.
    func dateFromNormal(_ str: String) -> Date? {
        self.timeZone = TimeZone(abbreviation: "UTC")//NSTimeZone.local
        self.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return self.date(from: str)
    }
    
    /// Return weak day label.
    /// - parameter date: date object to be formatted as string.
    /// - returns: String for weekday label based on local calendar's weekday symbols.
    func weekDayLabel(date: Date) -> String {
        return weekdaySymbols[Calendar.current.component(.weekday, from: date)-1]
    }
}
