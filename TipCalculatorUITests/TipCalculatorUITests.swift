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
    }
}
