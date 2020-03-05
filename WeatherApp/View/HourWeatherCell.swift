//
//  HourWeatherCell.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// UICollectionViewCell object to customize weather cell for a certain hour.
class HourlyWeatherCell: UICollectionViewCell {
    
    /// Hour label formatted, connect in storyboard.
    @IBOutlet weak var hourLabel: UILabel!
    
    /// Temperature icon image view, connect in storyboard.
    @IBOutlet weak var tempIcon: UIImageView!
    
    /// Temperature in celsius, connect in storyboard.
    @IBOutlet weak var tempLabel: UILabel!
    
    /// Set label and image view by viewmodel.
    func setup(hourWeatherVm: HourlyWeatherVM) {
        hourLabel.text = hourWeatherVm.hourLabel
        self.tempIcon.image = hourWeatherVm.weatherIcon.value ?? UIImage(named: "TempIcon")
        hourWeatherVm.weatherIcon.addAndNotify(observer: self) { image in
            DispatchQueue.main.async {
                self.tempIcon.image = image
            }            
        }
        tempLabel.text = hourWeatherVm.tempLabel
    }
}
