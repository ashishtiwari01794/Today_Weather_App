//
//  WeatherViewModel.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 23/05/21.
//

import Foundation
//MARK:- Delegate
protocol WeatherViewModelDelegate : AnyObject {
    func didReceiveValidationResponse(success: Bool,errorMsg:String)
}
struct WeatherViewModel {
    var delegate : WeatherViewModelDelegate?
    
    //validating the date
    func validation (date:Int){
        let validationResult = APICallValidation().validateDate(date: date )
        if validationResult.success {
            
            self.delegate?.didReceiveValidationResponse(success:true, errorMsg: validationResult.error!)
        }
        else {
            self.delegate?.didReceiveValidationResponse(success:false, errorMsg: validationResult.error!)
        }
    }
}

