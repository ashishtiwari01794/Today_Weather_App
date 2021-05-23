//
//  WeatherDetails.swift
//
//  Created by Ashish Tiwari on 19/05/21.
//

struct WeatherDetails: Decodable {
    let id: Int?
    let main, weatherDescription, icon: String?

        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
}
