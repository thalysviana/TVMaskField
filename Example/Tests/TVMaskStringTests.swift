//
//  TVMaskStringTests.swift
//  TVMaskField_Tests
//
//  Created by Thalys Viana on 14/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import TVMaskField

@testable import TVMaskField

class TVMaskStringTests: XCTestCase {

    var sut: TVMaskString!
    
    override func setUpWithError() throws {
        sut = TVMaskString()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testIfEntryHasValidNumberForMaskReturnsTrue() {
        // Act
        let isNumberBetweenZeroAndNine = sut.isValidNumber(forEntry: "2")
        
        // Assert
        XCTAssertTrue(isNumberBetweenZeroAndNine)
    }
    
    func testIfEntryHasValidNumberForMaskReturnsFalse() {
        // Arrange
        // Act
        let isNumberBetweenZeroAndNine = sut.isValidNumber(forEntry: "A")
        
        // Assert
        XCTAssertFalse(isNumberBetweenZeroAndNine)
    }
    
    func testIfEntryHasValidLetterForMaskReturnsTrue() {
        // Arrange
        // Act
        let isLetter = sut.isValidLetter(forEntry: "A")
        
        // Assert
        XCTAssertTrue(isLetter)
    }
    
    func testIfEntryHasValidLetterForMaskReturnsFalse() {
        // Arrange
        // Act
        let isLetter = sut.isValidLetter(forEntry: "1")
        
        // Assert
        XCTAssertFalse(isLetter)
    }
    
    func testIfEntrHasAlphanumericValueReturnsTrue() {
        // Arrange
        // Act
        let isAlphaNumeric = sut.isAlphanumeric(forEntry: "1A")
        
        // Assert
        XCTAssertTrue(isAlphaNumeric)
    }
    
    func testIfEntrHasAlphanumericValueReturnsFalse() {
        // Arrange
        // Act
        let isAlphaNumeric = sut.isAlphanumeric(forEntry: "😎")
        
        // Assert
        XCTAssertFalse(isAlphaNumeric)
    }
    
    func testUnmaskStringForNotFormattedInput() {
        // Arrange
        sut.stringMask = "(00) 00000-0000"
        
        // Act
        let unmaskedString = sut.unmask(entry: "99999999999")
        
        // Assert
        XCTAssertEqual(unmaskedString, "99999999999")
    }
    
    func testUnmaskStringForFormattedInput() {
        // Arrange
        sut.stringMask = "(00) 00000-0000"
        
        // Act
        let unmaskedString = sut.unmask(entry: "(99) 99999-9999")
        
        // Assert
        XCTAssertEqual(unmaskedString, "99999999999")
    }
    
    func testUnmaskStringForEntryBiggerThanMask() {
        // Arrange
        sut.stringMask = "(00) 00000-0000"
        // Act
        let unmaskedString = sut.unmask(entry: "(99) 99999-9999123")
        
        // Assert
        XCTAssertEqual(unmaskedString, "99999999999")
    }
    
    func testHasValidMaskCharacterReturnsTrue() {
        // Arrange
        // Act
        let isValidMaskCharacter = sut.hasValidMaskCharacter(char: "0")
        
        // Assert
        XCTAssertTrue(isValidMaskCharacter)
    }
    
    func testHasValidMaskCharacterReturnsFalse() {
        // Arrange
        // Act
        let isValidMaskCharacter = sut.hasValidMaskCharacter(char: "?")
        
        // Assert
        XCTAssertFalse(isValidMaskCharacter)
    }
    
    func testIfCanReplaceMaskForStringReturnsTrue() {
        // Assert
        // Act
        let canReplaceMaskCharacterForString = sut.canReplaceMaskCharacterForString(maskChar: "0", string: "1")
        
        // Assert
        XCTAssertTrue(canReplaceMaskCharacterForString)
    }
    
    func testIfCanReplaceMaskForStringReturnsFalse() {
        // Assert
        // Act
        let canReplaceMaskCharacterForString = sut.canReplaceMaskCharacterForString(maskChar: "0", string: "A")
        
        // Assert
        XCTAssertFalse(canReplaceMaskCharacterForString)
    }
    
    func testMaskStringForNotFormattedEntry() {
        // Assert
        sut.stringMask = "(00) 00000-0000"
        
        // Act
        let maskedString = sut.mask(entry: "99999999999")
        
        // Assert
        XCTAssertEqual(maskedString, "(99) 99999-9999")
    }
    
    func testMaskStringForFormattedEntry() {
        // Arrange
        // Act
        let maskedString = sut.mask(entry: "(99) 99999-9999")
        
        // Assert
        XCTAssertEqual(maskedString, "(99) 99999-9999")
    }
    
    func testOffsetStringValueForMaskComparisson() {
        // Arrange
        // Act
        let offset = sut.offsetFor(previousValue: "123", currentValue: "1234")
        
        // Assert
        XCTAssertEqual(offset, 1)
    }
}
