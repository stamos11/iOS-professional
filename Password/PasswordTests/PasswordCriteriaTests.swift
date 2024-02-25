//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by stamoulis nikolaos on 25/2/24.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    
    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789123456789123456789123456"))
    }
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }
    func testvalidlong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    func testLengthAndNoSpaceMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    func testUpperCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.upperCaseMet("A"))
    }
    func testUpperCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.upperCaseMet("a"))
    }
    func testLowerCaseMet() throws {
        XCTAssertFalse(PasswordCriteria.upperCaseMet("a"))
    }
    func testLowerCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowerCaseMet("A"))
    }
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    func testSpecialCharMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("@"))
    }
    func testSpecialCharNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("a"))
    }
}
