//
//  SettingsViewController.swift
//  OpenWeather
//
//  Created by a.a.mitrofanova on 21/09/2020.
//  Copyright © 2020 mngey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print(success)
            }
        }
    }
    

}
extension SettingsViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}
