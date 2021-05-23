//
//  Weather.swift
//  Created by Ashish Tiwari on 19/05/21.
//


import Foundation

// MARK: - Welcome
struct CurrentWeather: Decodable {
    let coord: Coord?
      let weather: [WeatherDetails]?
      let base: String?
      let main: Main
      let visibility: Int?
      let wind: Wind?
      let clouds: Clouds?
      let dt: Int?
      let sys: Sys?
      let timezone, id: Int?
      let name: String?
      let cod: Int?
}



