//
//  StringExtensionsTests.swift
//  StringExtensions
//
//  Created by Benjamin Ludwig on 17.12.19.
//  Copyright © 2019 Benjamin Ludwig. All rights reserved.
//

import XCTest
@testable import StringExtensions

final class StringExtensionsTests: XCTestCase {
    
    func testCamelCaseToWords() {
        
        XCTAssertEqual("thisIsATest".camelCaseToWords(), "this Is A Test")
        XCTAssertEqual("ABC".camelCaseToWords(), "A B C")
        XCTAssertEqual("".camelCaseToWords(), "")
    }
    
    func testVariableNameCases() {
        
        let mixedCaseWords = "my sUPER Fancy variablE NAME"
        XCTAssertEqual(mixedCaseWords.transforming(from: .words, to: .words), "my super fancy variable name")
        
        let emptyWords = ""
        for outerVariableNameCase in String.VariableNameCase.allCases {
            for innerVariableNameCase in String.VariableNameCase.allCases {
                XCTAssertEqual(emptyWords.transforming(from: outerVariableNameCase, to: innerVariableNameCase), "")
            }
        }
        
        let words = "my super fancy variable name"
        let lowerCamel = words.transforming(from: .words, to: .lowerCamel)
        XCTAssertEqual(lowerCamel, "mySuperFancyVariableName")
        XCTAssertEqual(lowerCamel.transforming(from: .lowerCamel, to: .words), words)
        
        let upperCamel = words.transforming(from: .words, to: .upperCamel)
        XCTAssertEqual(upperCamel, "MySuperFancyVariableName")
        XCTAssertEqual(upperCamel.transforming(from: .lowerCamel, to: .words), words)
        
        let lowerSnake = words.transforming(from: .words, to: .lowerSnake)
        XCTAssertEqual(lowerSnake, "my_super_fancy_variable_name")
        XCTAssertEqual(lowerSnake.transforming(from: .lowerSnake, to: .words), words)
        
        let upperSnake = words.transforming(from: .words, to: .upperSnake)
        XCTAssertEqual(upperSnake, "MY_SUPER_FANCY_VARIABLE_NAME")
        XCTAssertEqual(upperSnake.transforming(from: .lowerSnake, to: .words), words)
        
        let lowerKebab = words.transforming(from: .words, to: .lowerKebab)
        XCTAssertEqual(lowerKebab, "my-super-fancy-variable-name")
        XCTAssertEqual(lowerKebab.transforming(from: .lowerKebab, to: .words), words)
        
        let upperKebab = words.transforming(from: .words, to: .upperKebab)
        XCTAssertEqual(upperKebab, "MY-SUPER-FANCY-VARIABLE-NAME")
        XCTAssertEqual(upperKebab.transforming(from: .lowerKebab, to: .words), words)
    }
    
    func testUppercasedFirstLetter() {
        
        XCTAssertEqual("test".uppercasedFirstLetter(), "Test")
        
        var test = "test"
        test.upercaseFirstLetter()
        XCTAssertEqual(test, "Test")
    }
    
    func testLowercasedFirstLetter() {
        
        XCTAssertEqual("Test".lowercasedFirstLetter(), "test")
        
        var test = "Test"
        test.lowercaseFirstLetter()
        XCTAssertEqual(test, "test")
    }
    
    static var allTests = [
        ("testCamelCaseToWords", testCamelCaseToWords),
        ("testUppercasedFirstLetter", testUppercasedFirstLetter),
        ("testLowercasedFirstLetter", testLowercasedFirstLetter),
    ]
}
