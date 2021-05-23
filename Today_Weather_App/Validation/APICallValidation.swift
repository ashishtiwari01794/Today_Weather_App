//
//  APICallValidation.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 23/05/21.
//

import Foundation
struct APICallValidation {
    
    func validateDate(date:Int)  -> ValidationResult {
        if isPrime(number:date) {
            return ValidationResult(success: true, error: "Date is Prime")
        }
        else {
            return ValidationResult(success: false, error: "Not a prime date")
        }
        
        
        
    }
    
    //check the selected date is prime or not
    func isPrime(number: Int) -> Bool {
        if (number > 0) {
            switch number {
            case 1: // you can put multiple cases on one line
                return false
            case 2, 3:
                return true
            default:
                for i in 2...Int(sqrt(Double(number))) {
                    if number % i == 0 {
                        return false
                    }
                }
                return true
            }
        }
        else {
            debugPrint("Invalid Date")
            return false
        }
    }
}
