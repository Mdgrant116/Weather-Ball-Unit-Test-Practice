//
//  ViewController.swift
//  Weather Ball Unit Test Practice
//
//  Created by Michael Grant on 11/10/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
   
    

    
    // MARK: - Outlets
    
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var temperaturLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delgate = self 
        
    }

    
    // MARK: - Textfield Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextField.endEditing(true)
        
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            
            weatherManager.fetchWeather(cityName: city)
            
        }
        
        searchTextField.text = ""
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       
        if textField.text != "" {
            
            return true
            
        } else {
            
            textField.placeholder = "Enter City"
            
            return false
        }
        
    }

    
    //MARK: - Weather Manager Delegate Methods
    
    func didUpdateWeather(weather: WeatherModel) {
        
        print(weather.temperature)
           
       }
    
    // MARK: - Buttons
    
    @IBAction func searchPressed(_ sender: Any) {
    
        searchTextField.endEditing(true)
    }
    
}

