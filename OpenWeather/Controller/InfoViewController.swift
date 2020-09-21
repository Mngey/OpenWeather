//
//  InfoViewController.swift
//  OpenWeather
//
//  Created by a.a.mitrofanova on 21/09/2020.
//  Copyright © 2020 mngey. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    let infoText = "This app is made to show the current weather based on your location. You can also check the weather in different cities via this app."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoLabel.text = infoText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
