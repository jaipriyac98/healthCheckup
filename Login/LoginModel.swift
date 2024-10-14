//
//  RegisterModel.swift
//  HealthCheckup
//
//  Created by MAC on 23/03/23.
//

import Foundation
import Kingfisher

enum LoginModel {
    enum LoginData {

struct Request: Codable {
    let identifier: String?
    let password: String?
    let device_token: String?
}
    
struct Response: Codable {
            let code: Int
            let status, message, token: String
            let isVerified: Int
            let firstTimeLogin: Bool
            let userinfo: Userinfo

            enum CodingKeys: String, CodingKey {
                case code, status, message, token
                case isVerified = "is_verified"
                case firstTimeLogin = "first_time_login"
                case userinfo
            }
        }

        // MARK: - Userinfo
        struct Userinfo: Codable {
            let email, name, mobileNo, uid: String

            enum CodingKeys: String, CodingKey {
                case email, name
                case mobileNo = "mobile_no"
                case uid
            }
        }

    }
}

