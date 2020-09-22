//
//  ChangeCityViewController.swift
//  OpenWeather
//
//  Created by a.a.mitrofanova on 20/09/2020.
//  Copyright © 2020 mngey. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnteredNewCityName(city: String)
}

class ChangeCityViewController: UIViewController {
    
    var delegate: ChangeCityDelegate?

   
    @IBOutlet weak var findWeatherButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        findWeatherButton.layer.cornerRadius = 10
        changeMode()
        cityTextField.layer.cornerRadius = 10
    }
    
    func changeMode(){
        if self.traitCollection.userInterfaceStyle == .dark {
            findWeatherButton.backgroundColor = UIColor.darkGray
           
            cityTextField.backgroundColor = UIColor.gray
            cityTextField.tintColor = UIColor.white
        }else{
       return
        }
    }
    
    @IBAction func getWeatherTapped(_ sender: Any) {
        guard let cityName = cityTextField.text else {
            return
        }
        delegate?.userEnteredNewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
 

