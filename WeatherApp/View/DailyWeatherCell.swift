//
//  DayWeatherCell.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// UITableViewCell object to customize weather cell for a certain day.
class DailyWeatherCell: UITableViewCell {
    
    /// Day label formatted in **MMM d**, connect in storyboard.
    @IBOutlet weak var dayLabel: UILabel!
    
    /// Weak label(for ex: Monday,...), connect in storyboard.
    @IBOutlet weak var weakLabel: UILabel!
    
    /// Hourly weathers collection view.
    @IBOutlet weak var hourlyWeathersCollectionView: UICollectionView!
    
    /// Daily weather view model.
    var dailyWeathersVm: DailyWeatherVM!
    
    /// Set label and collection view by viewmodel.
    func setup(vm: DailyWeatherVM) {
        dailyWeathersVm = vm
        dailyWeathersVm.hourWeathers.data.addAndNotify(observer: self) { hourVm in
            DispatchQueue.main.async {
                self.hourlyWeathersCollectionView.reloadData()
            }
        }
        
        dayLabel.text = dailyWeathersVm.dayLabel
        weakLabel.text = dailyWeathersVm.weekLabel
        hourlyWeathersCollectionView.dataSource = self
    }
}
