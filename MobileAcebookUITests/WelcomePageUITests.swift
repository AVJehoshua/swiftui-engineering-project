//
//  WelcomePageUITests.swift
//  MobileAcebookUITests
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import XCTest

final class WelcomePageUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launch()
    }

    func testWelcomeMessageExists() {
        XCTAssertTrue(app.staticTexts["welcomeText"].exists)
    }

    func testImageExists() {
        XCTAssertTrue(app.images["makers-logo"].exists)
    }

    func testSignUpButtonExists() {
        XCTAssertTrue(app.buttons["signUpButton"].exists)
    }
}
