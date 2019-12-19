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
