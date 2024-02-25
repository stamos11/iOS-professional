//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by stamoulis nikolaos on 25/2/24.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_WhenValidation_Is_Inline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // inline
    }
    /*
     if shouldResetCriteria {
     // inline validation (tick or empty circle)
     } else {
     ...
     }
     */
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // tick
    }
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // empty circle
    }
}
class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // inline
    }
    /*
     if shouldResetCriteria {
     // inline validation (tick or empty circle)
     } else {
     ...
     }
     */
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // tick
    }
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // X
      
    }
}

class PasswordStatusViewTests_Validate_Three_Of_Four: XCTestCase {
    
    var statusView: PasswordStatusView!
    let twoOfFour = "12345678A"
    let threeOfFour = "12345678Aa"
    let fourOfFour = "12345678Aa!"
    
    // Verify is valid if three of four criteriamet
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    func testTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    func testThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }
    func testFourOFFour() throws {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}
