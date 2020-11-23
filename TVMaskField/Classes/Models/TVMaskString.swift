//
//  TVMaskString.swift
//  Pods
//
//  Created by Thalys Viana on 14/11/20.
//

import Foundation

struct TVMaskString {
    private let maskCharacters = [
        "0": "0",
        "A": "A",
        "*": "*"
    ]
    
    var stringMask: String = ""
    
    func mask(entry: String = "") -> String {
        if stringMask.isEmpty { return entry }
        let unmaskedString = unmask(entry: entry)
        
        var maskedStringIndex = 0
        var unmaskedStringIndex = 0
        var newString = ""
        var originalString = ""
        
        while maskedStringIndex < stringMask.count && unmaskedStringIndex < unmaskedString.count {
            let maskIndex = stringMask.index(stringMask.startIndex, offsetBy: maskedStringIndex)
            let unmaskedIndex = unmaskedString.index(unmaskedString.startIndex, offsetBy: unmaskedStringIndex)
            let maskDescription = stringMask[maskIndex].description
            let unmaskedStringDescription = unmaskedString[unmaskedIndex].description
            if canReplaceMaskCharacterForString(maskChar: maskDescription, string: unmaskedStringDescription) {
                newString += unmaskedStringDescription
                originalString = newString
                maskedStringIndex += 1
                unmaskedStringIndex += 1
            } else {
                if hasValidMaskCharacter(char: maskDescription) {
                    return originalString
                } else {
                    newString += maskDescription
                    maskedStringIndex += 1
                }
            }
        }
        return newString
    }
    
    func unmask(entry: String) -> String {
        var newString = ""
        var maskString = stringMask
        maskString.removeAll(where: { maskCharacters[$0.description] == nil })
        
        var curIndex = 0
        
        for value in entry {
            let valueDescription = value.description
            for (_, maskValue) in maskCharacters {
                if canReplaceMaskCharacterForString(maskChar: maskValue, string: valueDescription) {
                    newString += valueDescription
                    curIndex += 1
                    break
                }
            }
            if curIndex >= maskString.count {
                return newString
            }
        }
        return newString
    }
    
    func canReplaceMaskCharacterForString(maskChar: String, string: String) -> Bool {
        if maskChar == "*" && isAlphanumeric(forEntry: string) ||
            maskChar == "A" && isValidLetter(forEntry: string) ||
            maskChar == "0" && isValidNumber(forEntry: string)
            {
            return true
        }
        return false
    }
    
    func isValidNumber(forEntry entry: String) -> Bool {
        return entry.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    func isValidLetter(forEntry entry: String) -> Bool {
        return entry.rangeOfCharacter(from: .letters) != nil
    }
    
    func isAlphanumeric(forEntry entry: String) -> Bool {
        return entry.rangeOfCharacter(from: .alphanumerics) != nil
    }
    
    func hasValidMaskCharacter(char: String) -> Bool {
        if maskCharacters[char] == nil {
            return false
        } else {
            return true
        }
    }
    
    func offsetFor(previousValue: String, currentValue: String) -> Int {
        return (currentValue.count - previousValue.count) 
    }
}
