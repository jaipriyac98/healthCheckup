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
    case LoginApi = "auth/login"
    case QuestionApi = "api/questionnaires"

    
}



// MARK: - ========================== Base url ============================


public enum enviornment: String {
      // case development = "https://boast.projectdemo.site/api/"
    case production = "https://healthcheck-app.projectdemo.site/"
    
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
