//
//  Date_Validate_Tests.swift
//  Today_Weather_AppTests
//
//  Created by Ashish Tiwari on 23/05/21.
//
import XCTest
@testable import Today_Weather_App

class Date_Validate_Tests: XCTestCase {
    
    var validateDate: APICallValidation!
    
    override func setUp() {
        super.setUp()
        validateDate = APICallValidation()
    }
    
    override func tearDown() {
       
        validateDate = nil
        super.tearDown()
    }
    //Test  the number is prime

    
    func test_date_is_prime() {
        XCTAssertTrue(validateDate.isPrime(number: 2 ))
    }
    
    func test_date_is_ptime_false() {
        XCTAssertFalse(validateDate.isPrime(number: -1 ))
    }


}
