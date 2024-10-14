//
//  APIErrorModel.swift
//  EnrichSalon
//

import Foundation

struct ErrorData: Codable {
    let error: ErrorModel?
    let errors: AnyCodable?
    let code: String?
    let title: String?
    let status: Int?
    let traceId: String?
}
struct ErrorModel: Codable {
    let code: String?
    let message: String?
}


struct RefreshRequest: Codable {
    let access_token: String?
    let refresh_token: String?
    let is_custom: Bool = true
    let user_type: Int = 3
}

struct RefreshResponse: Codable {
    let message: String?
    let success: Bool?
    let data: RefreshResponseAT?
}

struct RefreshResponseAT: Codable {
    let access_token: String?
}
