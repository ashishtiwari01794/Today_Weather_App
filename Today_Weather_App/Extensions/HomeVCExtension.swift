//
//  HomeVCExtension.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 23/05/21.
//

import Foundation
import UIKit

extension HomeViewController {
    func updateLabels() {
        guard let currentWeatherViewModel = currentWeatherViewModel else { return }
        cityNameLbl.text = currentWeatherViewModel.city
        highTempLbl.text = currentWeatherViewModel.highTempString
        lowTempLbl.text = currentWeatherViewModel.lowTempString
        currentTempLbl.text = currentWeatherViewModel.tempString
    }
    
     func getWeather(request:WeatherInfoRequest) {
        apiManager.getWeather(weatherInfoRequest: request) { (weather, error) in
            if let error = error {
                print("Get weather error: \(error.localizedDescription)")
                return
            }
            guard let weather = weather  else { return }
            self.searchResult = weather
            print("Current Weather Object:")
            print(weather)
        }
    }
    

    
    func didReceiveLoginResponse(success: Bool,errorMsg:String) {
        if success {
            getWeather(request: WeatherInfoRequest(lat: "\(userLocation.coordinate.latitude)", lon: "\(userLocation.coordinate.longitude)", appid: Constants.api_id, units: Constants.units))
            
        }
        else {
            self.txtDate.resignFirstResponder()
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message:errorMsg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
    }
}
