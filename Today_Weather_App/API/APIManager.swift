//
//  APIManager.swift
//  Created by Ashish Tiwari on 19/05/21.
//

import Foundation

class APIManager {
    let weatherInfoUrl = URL(string: ApiEndpoints.weatherInfoBaseUrl)!

    func getWeather(weatherInfoRequest: WeatherInfoRequest,completion: @escaping (_ weather: CurrentWeather?, _ error: Error?) -> Void) {
        var components = URLComponents(url: weatherInfoUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = weatherInfoRequest.convertToURLQueryItems()
        getJSONFromURL(urlString: components?.url?.absoluteString ?? "") { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createWeatherObjectWith(json: data, completion: { (weather, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(weather, nil)
            })
        }
    }

}


