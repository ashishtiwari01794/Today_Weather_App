//
//  API_Repo_Tests.swift
//  Today_Weather_AppTests
//
//  Created by Ashish Tiwari on 23/05/21.
//

import XCTest
@testable import Today_Weather_App

class API_Repo_Tests: XCTestCase {
    var apiManager = APIManager()
    
    
    override func setUp() {
        super.setUp()
        apiManager = APIManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_get_weather_with_invalidRequest() {
        // ARRANGE
        let request = WeatherInfoRequest(lat: "", lon: "", appid: "", units: "")
        let expectations = expectation(description: "WithInValidRequest_Returns_WeatherData")
        
        // ACT
        apiManager.getWeather(weatherInfoRequest: request) { (weather, error) in
            
            XCTAssertNil(weather)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_get_api_with_validRequest() {
        
        // ARRANGE
        let request = WeatherInfoRequest(lat: "24.604913179250676", lon: "81.31827844319223", appid: Constants.api_id, units: Constants.units)
        let expectations = expectation(description: "WithValidRequest_Returns_WeatherData")
        
        // ACT
        apiManager.getWeather(weatherInfoRequest: request) { (weather, error) in
            
            XCTAssertNotNil(weather)
            XCTAssertNil(error)
            XCTAssertEqual(200, weather?.cod)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
}
