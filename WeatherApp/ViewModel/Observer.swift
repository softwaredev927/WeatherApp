//
//  Observer.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

//  Observable Class for binding ViewModel with View.
class Observer<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value: T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    /// Add observer.
    /// - parameter : observer to observe this object.
    /// - parameter completionHandler : observe handler when this object set.
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    /// Add observer and notify.
    /// - parameter observer : observer to observe this object.
    /// - parameter completionHandler : observe handler when this object set.
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    /// Notify to all observers.
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    /// Destroy observers.
    deinit {
        observers.removeAll()
    }
    
}
