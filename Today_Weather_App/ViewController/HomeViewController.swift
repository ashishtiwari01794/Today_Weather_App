//
//  ViewController.swift
//  Today_Weather_App
//
//  Created by Ashish Tiwari on 19/05/21.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate, WeatherViewModelDelegate {
    @IBOutlet weak var btnCalander: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!
    let apiManager = APIManager()
    private(set) var currentWeatherViewModel: CurrentWeatherViewModel?
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    var locationManager = CLLocationManager()
    var userLocation  = CLLocation()
    var weatherViewModel  = WeatherViewModel()
    var searchResult: CurrentWeather? {
        didSet {
            guard let searchResult = searchResult else { return }
            currentWeatherViewModel = CurrentWeatherViewModel.init(currentWeather: searchResult)
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDate.setInputViewDatePicker(target: self, selector: #selector(tapDoneSelection))
        locationManager = CLLocationManager()
        weatherViewModel.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
        
        
    }
    //MARK:- Location delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        getWeather(request: WeatherInfoRequest(lat: "\(userLocation.coordinate.latitude)", lon: "\(userLocation.coordinate.longitude)", appid: Constants.api_id, units: Constants.units))
    }
    
    //MARK:- Date Picker Done Selection
    @objc func tapDoneSelection() {
        if let datePicker = self.txtDate.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd, MMM yyyy"
            self.txtDate.text = dateformatter.string(from: datePicker.date)
            let dateformatter1 = DateFormatter()
            dateformatter1.dateFormat = "dd"
            let date = Int(dateformatter1.string(from: datePicker.date))
            weatherViewModel.validation(date: date ?? 0)
            debugPrint(dateformatter1.string(from: datePicker.date))
        }
        
        self.txtDate.resignFirstResponder()
    }
    //MARK:- Calendar Tap
    @IBAction func onCalanderTap(_ sender: Any) {
        self.txtDate.becomeFirstResponder()
    }
}
