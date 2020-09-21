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

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBAction func getWeatherTapped(_ sender: Any) {
        guard let cityName = cityTextField.text else {
            return
        }
        delegate?.userEnteredNewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }
}
 

