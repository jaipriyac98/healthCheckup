//
//  ValidateUserGetTokenModel.swift
//  Swiipr
//
//  Created by Sri Ramakrishnan on 28/05/22.
//  Copyright © 2022 Mugdha Mundhe. All rights reserved.
//

import Foundation

// MARK: - ValidateUserGetTokenResponse
struct ValidateUserGetTokenResponse: Codable {
    let accessToken, tokenType, expiresIn, refreshToken: String?
    let idToken: String?
    let error, errorDescription: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case idToken = "id_token"
        case error
        case errorDescription = "error_description"
    }
}

// MARK: - RefrehTokenResponse
struct RefrehTokenResponse: Codable {
    let accessToken, idToken, tokenType: String?
    let notBefore, expiresIn, expiresOn: Int?
    let resource: String?
    let idTokenExpiresIn: Int?
    let profileInfo, scope, refreshToken: String?
    let refreshTokenExpiresIn: Int?
    let error, errorDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case idToken = "id_token"
        case tokenType = "token_type"
        case notBefore = "not_before"
        case expiresIn = "expires_in"
        case expiresOn = "expires_on"
        case resource
        case idTokenExpiresIn = "id_token_expires_in"
        case profileInfo = "profile_info"
        case scope
        case refreshToken = "refresh_token"
        case refreshTokenExpiresIn = "refresh_token_expires_in"
        case error
        case errorDescription = "error_description"
    }
}
