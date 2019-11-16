//
//  WeatherManager.swift
//  Weather Ball Unit Test Practice
//
//  Created by Michael Grant on 11/16/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d7b5d1a2082c43bd6c3a7686f6f5f404&units=metric"
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String) {
        
        //Step 1 Create URL
        
        if let url = URL(string: urlString) {
            
            //Step 2 Create URL Session
            
            let session = URLSession(configuration: .default)
            
            //Step 3 Give Session A Task
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //Step 4 Start Task
            
            task.resume()
            
        }
        
    }
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil {
            
            print(error!)
            
            return
        }
        if let safeData = data {
            
            let dataString = String(data: safeData, encoding: .utf8)
            
            print(dataString)
        }
    }
}
