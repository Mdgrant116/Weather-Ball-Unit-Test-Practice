//
//  ViewController.swift
//  Weather Ball Unit Test Practice
//
//  Created by Michael Grant on 11/10/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
   
    

    
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

}
   
//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
      
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

        
        @IBAction func searchPressed(_ sender: Any) {
        
            searchTextField.endEditing(true)
            
        }
        
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
           
           DispatchQueue.main.async {
               self.temperaturLabel.text = weather.temperatureString
               self.conditionImageView.image = UIImage(systemName: weather.conditionName)
          }
        
       }
       
       func didFailWithError(error: Error) {
           
           print(error)
       }
    
}
