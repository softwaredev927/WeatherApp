//
//  WeathersVM+UITableViewDataSource.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// Extension of WeathersVM for daily weathers table view.
class DailyWeatherDataSource: GenericDataSource<DailyWeatherVM>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dayWeatherVm = self.data.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "day_cell", for: indexPath) as! DailyWeatherCell
        cell.setup(vm: dayWeatherVm)
        return cell
    }
}
