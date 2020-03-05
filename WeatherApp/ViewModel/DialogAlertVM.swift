//
//  DialogAlertVM.swift
//  WeatherApp
//
//  Created by Longzhu on 16/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import Foundation

/// Alert Dialog view model.
class DialogAlertVM {
    
    /// Title of dialog.
    var title: String = ""
    
    /// Message of dialog.
    var description: String = ""
    
    /// Title of action button.
    var actionTitle: String = "Retry"
    
    /// Need to show or not.
    var showOrHide = Observer(false)
}
