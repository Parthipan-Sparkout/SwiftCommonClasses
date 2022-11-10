//
//  InputValidationService.swift
//  GPS Food User
//
//  Created by Mac on 02/09/22.
//  Copyright © 2022 Fastbee User. All rights reserved.
//

protocol VerifyUsernameValidator {
    func validateUsername(string: String) throws -> String
    func validateUserFullName(string: String) throws -> String
}

protocol PasswordValidator {
    func validatePassword(string: String) throws -> String
}

protocol GovernmentIDValidator {
    func validateGovernmentId(string: String) throws -> String
    func validateGovernmentIdProof(string: String) throws
}

protocol GenderValidator {
    func validateGender(string: String) throws -> String
}

protocol DateOfBirthValidator {
    func validateDOB(string: String) throws -> String
}

import Foundation

class InputValidationService {}

// User name validation
extension InputValidationService: VerifyUsernameValidator {
    @discardableResult
    func validateUsername(string: String) throws -> String {
        if string.isEmpty { throw LocalError.usernameIsEmpty }
        if string.length < 3 { throw LocalError.userNameLength }
        return string
    }
    
    @discardableResult
    func validateUserFullName(string: String) throws -> String {
        if string.isEmpty { throw LocalError.userFullNameIsEmpty }
        return string
    }
}

// Password validation
extension InputValidationService: PasswordValidator {
    func validatePassword(string: String) throws -> String {
        if string.isEmpty { throw LocalError.passwordIsEmpty }
        if string.count < 8 { throw LocalError.minPasswordLength }
        let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*" // Allow number and Characters only
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        let valid = passwordTest.evaluate(with: string)
        if !valid { throw LocalError.passwordShouldBeAlphaNumeric }
        return string
    }
}

// Password validation
extension InputValidationService: GovernmentIDValidator {
    func validateGovernmentId(string: String) throws -> String {
        if string.isEmpty { throw LocalError.invalidGovernmentId }
        if string.count < 6 { throw LocalError.invalidGovernmentId }
      
        return string
    }
    
    func validateGovernmentIdProof(string: String) throws {
        if string.isEmpty { throw LocalError.invalidIdProof }
    }
}

extension InputValidationService: GenderValidator {
    func validateGender(string: String) throws -> String {
        let genders = UserGender.allCases.map { $0.title }
        if !genders.contains(string) { throw LocalError.genderNotSelected }
        return string
    }
}

extension InputValidationService: DateOfBirthValidator {
    func validateDOB(string: String) throws -> String {
        let dateFormattor = DateFormatter()
        dateFormattor.dateFormat = "dd/MM/yyyy"
        let invalidDob = dateFormattor.date(from: string) == nil
        if invalidDob { throw LocalError.invalidDob }
        return string
    }
}

enum UserGender: CaseIterable {
   case male
   case female
    case others
    var title: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .others:
            return "Others"
        }
    }
}
