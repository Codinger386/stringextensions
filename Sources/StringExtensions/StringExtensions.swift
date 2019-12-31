//
//  StringExtensions.swift
//  StringExtensions
//
//  Created by Benjamin Ludwig on 17.12.19.
//  Copyright © 2019 Benjamin Ludwig. All rights reserved.
//

import Foundation



extension String {
    
    // MARK: - Case extensions
    
    /// Returns a new `String` with the first letter uppercased.
    public func uppercasedFirstLetter() -> String {
      return prefix(1).uppercased() + self.dropFirst()
    }

    /// Uppercases the first letter of the `String`.
    public mutating func upercaseFirstLetter() {
      self = self.uppercasedFirstLetter()
    }
    
    /// Returns a new `String` with the first letter lowercased.
    public func lowercasedFirstLetter() -> String {
      return prefix(1).lowercased() + self.dropFirst()
    }

    /// Lowercases the first letter of the `String`.
    public mutating func lowercaseFirstLetter() {
      self = self.lowercasedFirstLetter()
    }

    
    // MARK: - Variable name case extensions
    
    /// Splits a camel-cased `String` into single words.
    public func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) && $0 != "" {
                return ($0 + " " + String($1))
            }
            else {
                return $0 + String($1)
            }
        }
    }

    private struct VariableNameCaseTransformer {
        
        static let words = VariableNameCaseTransformer(wordsToCase: { $0.lowercased() }, caseToWords: { $0.lowercased() })
        static let lowerCamel = VariableNameCaseTransformer(
            wordsToCase: { $0.split(separator: " ").compactMap { $0.capitalized }.joined(separator: "").lowercasedFirstLetter() },
            caseToWords: { $0.camelCaseToWords() })
        static let upperCamel = VariableNameCaseTransformer(
            wordsToCase: { $0.split(separator: " ").compactMap { $0.capitalized }.joined(separator: "").uppercasedFirstLetter() },
            caseToWords: { $0.camelCaseToWords() })
        static let lowerSnake = VariableNameCaseTransformer(
            wordsToCase: { $0.lowercased().replacingOccurrences(of: " ", with: "_") },
            caseToWords: { $0.replacingOccurrences(of: "_", with: " ") })
        static let upperSnake = VariableNameCaseTransformer(
            wordsToCase: { $0.uppercased().replacingOccurrences(of: " ", with: "_") },
            caseToWords: { $0.replacingOccurrences(of: "_", with: " ").lowercased() })
        static let lowerKebab = VariableNameCaseTransformer(
            wordsToCase: { $0.lowercased().replacingOccurrences(of: " ", with: "-") },
            caseToWords: { $0.replacingOccurrences(of: "-", with: " ") })
        static let upperKebab = VariableNameCaseTransformer(
            wordsToCase: { $0.uppercased().replacingOccurrences(of: " ", with: "-") },
            caseToWords: { $0.replacingOccurrences(of: "-", with: " ").lowercased() })

        let wordsToCase: (String) -> String
        let caseToWords: (String) -> String
    }
    
    /** A list of all cases that can be transformed into each other. To make this work properly and avoid unexpected behavior, single words are always considered to be lower cased.
     `words` is not really a valid case for variable naming, it serves as a neutral format for in- and output. Having it in the list makes a generic usage more easy.
     */
    public enum VariableNameCase: CaseIterable {

        case words, lowerCamel, upperCamel, lowerSnake, upperSnake, lowerKebab, upperKebab
        
        private var transformer: VariableNameCaseTransformer {
            switch self {
            case .words: return VariableNameCaseTransformer.words
            case .lowerCamel: return VariableNameCaseTransformer.lowerCamel
            case .upperCamel: return VariableNameCaseTransformer.upperCamel
            case .lowerSnake: return VariableNameCaseTransformer.lowerSnake
            case .upperSnake: return VariableNameCaseTransformer.upperSnake
            case .lowerKebab: return VariableNameCaseTransformer.lowerKebab
            case .upperKebab: return VariableNameCaseTransformer.upperKebab
            }
        }
        
        func toWords(_ input: String) -> String {
            return transformer.caseToWords(input)
        }
        
        func toCase(_ input: String) -> String {
            return transformer.wordsToCase(input)
        }
    }
    
    public func transforming(from: VariableNameCase, to: VariableNameCase) -> String {
        return to.toCase(from.toWords(self))
    }
}
