//
//  CurrentWeatherViewModel.swift
//
//  Created by Ashish Tiwari on 19/05/21.
//

import Foundation

struct CurrentWeatherViewModel {
    let currentWeather: CurrentWeather?
    private(set) var city = ""
    private(set) var tempString = ""
    private(set) var highTempString = ""
    private(set) var lowTempString = ""
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        updateProperties()
    }
    private mutating func updateProperties() {
        tempString = setTempString(currentWeather: currentWeather!)
        highTempString = setHighTempString(currentWeather: currentWeather!)
        lowTempString = setLowTempString(currentWeather: currentWeather!)
        city = setLocationString(currentWeather: currentWeather!)
    }
    
}

extension CurrentWeatherViewModel {
    
    private func setTempString(currentWeather: CurrentWeather) -> String {
        return "\(currentWeather.main.temp ?? 0.0)°C"
    }
    
    private func setHighTempString(currentWeather: CurrentWeather) -> String {
        return "\(currentWeather.main.temp ?? 0.0)°C"
    }
    
    private func setLowTempString(currentWeather: CurrentWeather) -> String {
        return "\(currentWeather.main.temp ?? 0.0)°C"
    }
    
    private func setLocationString(currentWeather: CurrentWeather) -> String {
        return "\(currentWeather.name ?? "")"
    }
}
