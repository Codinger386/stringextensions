//
//  StringExtensions.swift
//  StringExtensions
//
//  Created by Benjamin Ludwig on 17.12.19.
//  Copyright © 2019 Benjamin Ludwig. All rights reserved.
//

import Foundation

extension String {
    
    /// Splits a camel-cased `String` into single words.
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) && $0 != "" {
                return ($0 + " " + String($1))
            }
            else {
                return $0 + String($1)
            }
        }
    }
    
    /// Returns a new `String` with the first letter uppercased.
    func uppercasedFirstLetter() -> String {
      return prefix(1).uppercased() + self.dropFirst()
    }

    /// Uppercases the first letter of the `String`.
    mutating func upercaseFirstLetter() {
      self = self.uppercasedFirstLetter()
    }
    
    /// Returns a new `String` with the first letter lowercased.
    func lowercasedFirstLetter() -> String {
      return prefix(1).lowercased() + self.dropFirst()
    }

    /// Lowercases the first letter of the `String`.
    mutating func lowercaseFirstLetter() {
      self = self.lowercasedFirstLetter()
    }
}
