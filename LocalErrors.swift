//
//  LocalErrors.swift
//  Click2Eat
//
//  Created by Mac on 17/02/22.
//  Copyright © 2022 Notlob User. All rights reserved.
//

import Foundation

enum LocalError: LocalizedError {
    case unknownError(message: String? = "")
    case serverError
    case parsingError
    case restaurantNotFount
    case unAuthorized
    case invalidUrl
    case invalidLocation
    // New auth flow
    case usernameIsEmpty
    case userFullNameIsEmpty
    case userNameLength
    case userNameExist
    // Password error
    case passwordIsEmpty
    case repeatNewPasswordIsEmpty
    case minPasswordLength
    case validPassword
    case passwordNotMatch
    case passwordShouldBeAlphaNumeric
    // Gender validation
    case genderNotSelected
    // Date of birth validation
    case invalidDob
    // ID Proof
    case invalidIdProof
    case invalidGovernmentId
    // Profile picture

    var errorDescription: String? {
        switch self {
        case .unknownError(let message): return (message == nil || message == "") ? "Unknown Error!" : message
        case .serverError: return "Server Error!"
        case .parsingError: return "Unable to parse the response"
        case .restaurantNotFount: return "Restaurant not found!"
        case .userNameLength: return "User name must contains atleast 3letters"
        case .unAuthorized: return "Unauthorized request!"
        case .invalidUrl: return "Invalid AppStore URL!"
        case .invalidLocation: return "Invalid location!"
        case .passwordNotMatch: return "Password not match!"
        case .usernameIsEmpty: return "Username can't be empty!".localized()
        case .passwordIsEmpty: return "Password can't be empty!".localized()
        case .validPassword: return "Enter valid password!".localized()
        case .userNameExist: return "User name already Exist!".localized()
        case .repeatNewPasswordIsEmpty: return "Repeat Password can't be empty!".localized()
        case .minPasswordLength: return "Password should be minimum 8 characters".localized()
        case .passwordShouldBeAlphaNumeric: return "Password should be alphaNumeric".localized()
        case .userFullNameIsEmpty: return "User Full Name not to be empty".localized()
        case .genderNotSelected: return "Please choose valid gender".localized()
        case .invalidDob: return "Please choose valid date of birth".localized()
        case .invalidIdProof: return "Please choose valid Government ID Proof".localized()
        case .invalidGovernmentId: return "Please enter valid Government ID Number".localized()
        }
    }
}
