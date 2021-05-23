//
//  WeatherViewModel.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 23/05/21.
//

import Foundation

protocol WeatherViewModelDelegate : AnyObject {
    func didReceiveLoginResponse(success: Bool,errorMsg:String)
}


struct WeatherViewModel {
    var delegate : WeatherViewModelDelegate?
    
    
    func validation (date:Int){
        let validationResult = APICallValidation().validateDate(date: date )
        if validationResult.success {
            
            self.delegate?.didReceiveLoginResponse(success:true, errorMsg: validationResult.error!)
        }
        else {
            self.delegate?.didReceiveLoginResponse(success:false, errorMsg: validationResult.error!)
        }
    }
}

