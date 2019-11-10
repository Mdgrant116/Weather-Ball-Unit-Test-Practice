//
//  SettingsViewModelTest.swift
//  Weather Ball Unit Test PracticeTests
//
//  Created by Michael Grant on 11/10/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import XCTest

@testable import Weather_Ball_Unit_Test_Practice
class SettingsViewModelTest: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.settingsVM = SettingsViewModel()
    }
    
    
    func test_should_Make_Sure_The_Default_Selected_Unit_Is_Fahrenheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
        
    }
    
    func test_Should_Return_Correct_Display_Name_For_Fahrenheit() {
        
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    func test_Should_Be_Able_To_Save_User_Unit_Selection() {
        
        self.settingsVM.selectedUnit = .celsius
        
        let userDefaults = UserDefaults.standard
//        userDefaults.removeObject(forKey: "unit")
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
      func test_Should_Erase_Default_Value() {
            
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "unit")
        
            XCTAssertNil(userDefaults.value(forKey: "unit"))
        
//         XCTAssertNotNil(userDefaults.value(forKey: "unit"))
        
        }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.removeObject(forKey: "unit")
    }
    
}
