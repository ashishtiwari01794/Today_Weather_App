//
//  WeatherInfoRequest.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 22/05/21.
//

import Foundation
struct WeatherInfoRequest: Encodable {
    var lat,lon,appid,units: String?
}
