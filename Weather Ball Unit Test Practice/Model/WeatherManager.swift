//
//  WeatherManager.swift
//  Weather Ball Unit Test Practice
//
//  Created by Michael Grant on 11/16/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delgate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d7b5d1a2082c43bd6c3a7686f6f5f404&units=imperial"
    
    
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(with: urlString)
        
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        
        //Step 1 Create URL
        
        if let url = URL(string: urlString) {
            
            //Step 2 Create URL Session
            
            let session = URLSession(configuration: .default)
            
            //Step 3 Give Session A Task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                
                if error != nil {
                    
                    self.delgate?.didFailWithError(error: error!)
                    
                    return
                }
                if let safeData = data {
                    
                    if let weather = self.parseJSON(safeData) {
                        
                        self.delgate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            
            //Step 4 Start Task
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            
            let id = decodedData.weather[0].id
            let temperature = decodedData.main.temp
            let cityName = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)
            
            return weather
            
        } catch {
            
            self.delgate?.didFailWithError(error: error)
            
            return nil
        }
        
    }
    
    
    
}
