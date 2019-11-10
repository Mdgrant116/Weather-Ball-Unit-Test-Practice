//
//  WeatherListViewModelTests.swift
//  Weather Ball Unit Test PracticeTests
//
//  Created by Michael Grant on 11/10/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import XCTest
@testable import Weather_Ball_Unit_Test_Practice

class WeatherListViewModelTests: XCTestCase {

    
    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Grand Rapids", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 0, temperatureMax: 0)))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Marthas Vinyard", currentTemperature: TemperatureViewModel(temperature: 87, temperatureMin: 0, temperatureMax: 0)))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Oh No I Fell In The Sun", currentTemperature: TemperatureViewModel(temperature: 9941, temperatureMin: 0, temperatureMax: 0)))

    }
    
    func test_Should_Be_Able_To_Convert_To_Celsius_Successfully() {
        
        let celsiusTemperatures = [0, 30.5556 ,5505]
        
        self.weatherListVM.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            
            XCTAssertEqual(round(vm.currentTemperature.temperature), round(celsiusTemperatures[index]))
        }
        
    }
    

    override func tearDown() {
        
    }

  

}
