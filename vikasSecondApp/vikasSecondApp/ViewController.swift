//
//  ViewController.swift
//  vikasSecondApp
//
//  Created by F1xTeoNtTsS on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var cenliusLabel: UILabel!
    @IBOutlet weak var fahrehLabel: UILabel!
    @IBOutlet weak var slider: UISlider!{
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = -100
            slider.value = 0
            slider.tintColor = UIColor.black
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let tempCelsius = Int(round(sender.value))
        cenliusLabel.text = "\(tempCelsius)ºC"
        let fahrehTemp = Int(round(sender.value * 9 / 5)+32)
        fahrehLabel.text = "\(fahrehTemp)ºF"
    }
}

