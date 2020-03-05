//
//  ViewController.swift
//  WeatherApp
//
//  Created by Longzhu on 15/07/2019.
//  Copyright © 2019 Longzhu. All rights reserved.
//

import UIKit

/// ViewController to display weathers for a certain city.
class WeathersVC: UIViewController {
    
    /// Loading view to show activity indicator masking main view, connect in storyboard.
    @IBOutlet weak var loadingView: UIView!
    
    /// Name label of city to show temperatures, connect in storyboard.
    @IBOutlet weak var cityNameLabel: UILabel!
    
    /// Termpature label of the city now, connect in storyboard.
    @IBOutlet weak var cityNowTemp: UILabel!
    
    /// Weather list Table View, connect in storyboard.
    @IBOutlet weak var weatherListTableView: UITableView!
    
    /// DataSource for daily weathers' TableView.
    var dailyWeathersDataSource = DailyWeatherDataSource()
    
    /// View Model for Weathers View.
    lazy var weathersVm: WeatherListVM = {
        return WeatherListVM(ds: dailyWeathersDataSource as GenericDataSource<DailyWeatherVM>)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize view with WeathersVM.
        weathersVm.isLoading.addAndNotify(observer: self) { isLoading in
            if isLoading {
                if self.loadingView.isHidden {
                    self.loadingView.isHidden = false
                    self.loadingView.alpha = 0.1
                    UIView.animate(withDuration: 0.5, animations: { [weak self] in
                        guard let weakSelf = self else { return }
                        weakSelf.loadingView.alpha = 1
                    })
                }
            } else {
                self.weatherListTableView.reloadData()
                self.cityNowTemp.text = self.weathersVm.cityTemp
                self.loadingView.alpha = 1
                UIView.animate(withDuration: 0.5, animations: { [weak self] in
                    guard let weakSelf = self else { return }
                    weakSelf.loadingView.alpha = 0.1
                }, completion: { [weak self] (_: Bool) in
                    guard let weakSelf = self else { return }
                    weakSelf.loadingView.isHidden = true
                })
            }
        }
        weathersVm.dialogAlertVm.showOrHide.addAndNotify(observer: self) { [weak self, weak weathersVm] show in
            guard let weakSelf = self else { return }
            guard let weathersVm = weathersVm else { return }
            if show {
                let alertController = UIAlertController.init(title: weathersVm.dialogAlertVm.title,
                                       message: weathersVm.dialogAlertVm.description, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: weathersVm.dialogAlertVm.actionTitle, style: .default) { (action:UIAlertAction) in
                    weathersVm.loadWeatherList()
                    weathersVm.dialogAlertVm.showOrHide.value = false
                })
                weakSelf.present(alertController, animated: true, completion: nil)
            }
        }
        cityNameLabel.text = weathersVm.cityName
        cityNowTemp.text = weathersVm.cityTemp
        
        /// Set datasource of tableview and add observer.
        weatherListTableView.dataSource = dailyWeathersDataSource
        dailyWeathersDataSource.data.addAndNotify(observer: self) { [weak self] data in
            DispatchQueue.main.async {
                self!.weatherListTableView.reloadData()
            }
        }
    }
}
