//
//  DayWeatherVM+UICollectionViewDataSource.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// Extension of DayWeatherVM for hourly weathers collection view.
extension DailyWeatherCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyWeathersVm.hourWeathers.data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hourWeatherVm = dailyWeathersVm.hourWeathers.data.value[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hour_cell", for: indexPath) as! HourlyWeatherCell
        cell.setup(hourWeatherVm: hourWeatherVm)
        return cell
    }
}
