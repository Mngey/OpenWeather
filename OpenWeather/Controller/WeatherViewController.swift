//
//  ViewController.swift
//  OpenWeather
//
//  Created by a.a.mitrofanova on 18/09/2020.
//  Copyright © 2020 mngey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation


class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate  {

    let weatherDataModel = WeatherDataModel()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    //MARK:- Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String: String] = ["lat": latitude, "lon": longitude,"appid": weatherDataModel.apiId]
            getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLabel.text = "Couldn't find weather 😞"
    }
    //MARK:- Networking
    func getWeatherData(url: String, parameters: [String: String]){
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.value != nil {
                let weatherJSON: JSON = JSON(response.value!)
                self.updateWeatherData(json: weatherJSON)
                
            }else{
                self.cityLabel.text = "connection issue"
            }
        }
    }
    //MARK:- JSON Parsing with swifty JSON
    func updateWeatherData(json: JSON){
        if let tempResult = json["main"]["temp"].double{
            weatherDataModel.temp = Int(tempResult - 273.15)
            weatherDataModel.city = json["name"].stringValue
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            updateUIWithWeatherData()
        } else {
            self.cityLabel.text = "connection issue"
        }
    }
    
    //MARK:- Update UI
    
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        tempLabel.text = "\(weatherDataModel.temp)º"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        
    }
    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
    }
    }
    
    
     //MARK:- ChangeCityDelegate Delegate
    func userEnteredNewCityName(city: String) {
        let params: [String: String] = ["q": city, "appid": weatherDataModel.apiId]
        getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
        
    }
    
    }
        




