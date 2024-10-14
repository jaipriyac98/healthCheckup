//
//  NetworkStrings.swift
//  Swiipr
//
//  Created by Mugdha Mundhe on 25/08/20.
//  Copyright © 2020 Mugdha Mundhe. All rights reserved.
//

import Foundation
// MARK: - ========================== Encoding Generics ============================
enum statusCode {
    case success
    case error
}

typealias T = Encodable
typealias CompletionHandler = (_ status: statusCode, _ recordsArray: T?, _ errorMessage: String?, _ apiName: String) -> Void
protocol GeneralOutputMethods {
    func presentSuccess<T: Encodable>(data: T, success: Bool?, apiName: String)
    func presentError(errorMessage: String?, apiName: String)
}

protocol GeneralDisplayMethods {
    func displaySuccess<T: Encodable>(data: T, success: Bool?, apiName: String)
    func displayError(errorMessage: String?, apiName: String)
}

// MARK: - ========================== Strings ============================

public let internetConnectionError = "Please check your network connection!"
public let GenericError = "Something went wrong! Please try after sometime."
public let RefreshTokenExpire = "Refresh token expired!, Please do the login again."
public let TokenExpired = "Token expired!"

public enum ConstantAPINames: String {
    case walefareClaim = "v2/Welfare/Claim"
    case getCardDetails = "v2/Welfare/Claim/{ClaimId}/Cards/{card-id}"
    case getCardIds = "v2/Welfare/Claim/{ClaimId}/Cards"
    case getTransactionDetails = "v2/Welfare/Claim/{ClaimId}/Cards/{card-id}/transactions"
    case refreshToken = ""
    case getCardData = "v2/Welfare/Claim/{ClaimId}/Cards/{card-id}/Apple/{token}"
    case getServerCheckFlag = "v2/Device/Configuration"
    case postDeviceInfo = "v2/Device/Information"
    case deleteAccount = "v2.0/user/deletemobileuser"

    case nativeSingUpValidateMobile = "v2.0/user/validate/mobile"
    case nativeSingUpResendCode = "v2.0/user/validate/mobile/resendCode"
    case nativeSingUpVerifyCode = "v2.0/user/validate/mobile/verifyCode"
    case nativeSingUpUser = "v2.0/user/signup"
    case getUserDetails = "v2.0/user"
    
}



// MARK: - ========================== Base url ============================


public enum enviornment: String {
    case development = "https://swiiprx-api-dev.azurewebsites.net/"
    case production = "https://api.swiiprx.com/"
    
     //  https://login.swiiprx.com/swiiprx.com/B2C_1_Swiiprx_ROPC_Auth/oauth2/v2.0/token
}


func getBaseUrl() -> String {
//    #if DEBUG
//    return enviornment.development.rawValue
//    #elseif STAGE
//    return enviornment.development.rawValue
//    #elseif PRODUCTION
    return enviornment.production.rawValue
//    #endif
}
