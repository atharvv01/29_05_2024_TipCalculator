//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by E5000866 on 29/05/24.
//

import XCTest

class when_content_view_is_shown: XCTestCase {

    func test_should_make_sure_that_total_text_field_contains_default_value()
    {
        /*
         Here we are creating a instance of xcuiapplication,
         which kind of provides like a proxy to run our application
         Here app represents the apllication.
         */
        let app = XCUIApplication()
        //this means if there is failure dont continue the test
        continueAfterFailure = false
        //this will launch our application
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
    }
    
    func test_should_make_sure_20_percent_defualt_tip_option_is_selected()
    {
        /*
         Here we are creating a instance of xcuiapplication,
         which kind of provides like a proxy to run our application
         Here app represents the apllication.
         */
        let app = XCUIApplication()
        //this means if there is failure dont continue the test
        continueAfterFailure = false
        //this will launch our application
        app.launch()
        
        /*
         Now since we are checking for default percentage value selected ,
         which is implement using segment control so we will access it using
         segmented controls
         */
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegementedControl"]
        
        //now we want to see what index of segment control is selected
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        /*
         This only checks weather that particular index of segement control has the same value or not ,
         but we need to checkw wether it is selected or not
         */
        XCTAssertEqual(segmentedControlButton.label, "20%")
        
        //to check wether its selected or not we can do following
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
}
