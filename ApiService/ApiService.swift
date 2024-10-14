//
//  ApiService.swift
//  Swiipr
//
//  Created by Sri Ramakrishnan on 26/05/22.
//  Copyright © 2022 Mugdha Mundhe. All rights reserved.
//

import UIKit



enum ProdApiKeys
{
    static let sourcesURL = "https://api.swiiprx.com/"
    static let loginSourceURl = "https://login.swiiprx.com/swiiprx.com/B2C_1_Swiiprx_ROPC_Auth/oauth2/v2.0/token"
    static let prodClientID = "726029b6-647d-40c6-89a7-38e8c7f6961f"
    static  let resourceID = ["client_id" :"726029b6-647d-40c6-89a7-38e8c7f6961f","resource" : "726029b6-647d-40c6-89a7-38e8c7f6961f"]
    static  let scope = ["scope" :"openid https://swiiprx.com/api/access_as_user offline_access","client_id" : "726029b6-647d-40c6-89a7-38e8c7f6961f"]
    static let scopeString = "openid https://swiiprx.com/api/access_as_user offline_access"
}

enum DevelopmentApiKeys
{
    static let dev_sourcesURL = "https://swiiprx-api-dev.azurewebsites.net/"
    static let dev_loginSourceURl = "https://swiiprxdev.b2clogin.com/swiiprxdev.onmicrosoft.com/B2C_1_swiiprx_ROPC_Auth/oauth2/v2.0/token"
    static let dev_ClientID = "f60640e2-57e2-4d28-a4fa-2aee1841b921"
    static let dev_resourceID = ["client_id" :"f60640e2-57e2-4d28-a4fa-2aee1841b921","resource" : "f60640e2-57e2-4d28-a4fa-2aee1841b921"]
    static let dev_scope = ["scope" :"openid https://swiiprxdev.onmicrosoft.com/4fca06e6-7f28-4271-8b8e-60e608b84cb3/access_as_user offline_access","client_id" : "f60640e2-57e2-4d28-a4fa-2aee1841b921"]
    static let dev_scopeString = "openid https://swiiprxdev.onmicrosoft.com/4fca06e6-7f28-4271-8b8e-60e608b84cb3/access_as_user offline_access"
}



class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    
    func getsourcesURL() -> String
    {
       
        return ProdApiKeys.sourcesURL

        //        return DevelopmentApiKeys.dev_sourcesURL
       
    }
    func getscopeString() -> String
    {
       
        return ProdApiKeys.scopeString

        //        return DevelopmentApiKeys.dev_scopeString

    }
    
    func getloginSourceURl() -> String
    {

        return ProdApiKeys.loginSourceURl

        //        return DevelopmentApiKeys.dev_loginSourceURl

    }
    
    func getprodClientID() -> String
    {
        return ProdApiKeys.prodClientID

        //        return DevelopmentApiKeys.dev_ClientID

    }
    
    func getresourceID() -> [String: String]
    {

        return ProdApiKeys.resourceID

        //        return DevelopmentApiKeys.dev_resourceID
    }
    
    func getscope() -> [String: String]
    {

        return ProdApiKeys.scope

        //        return DevelopmentApiKeys.dev_scope
     
    }
    
    
    // Validate User And Get Token
    
    func apiValidateUserGetToken(params: [String: String],username : String, pasword : String,  completion : @escaping (ValidateUserGetTokenResponse?, Bool) -> ()) {
        
        let Url = URL(string:"\(getloginSourceURl())")
        let result = getscope().merged(with: params)
        var request = URLRequest(url: Url!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: result, options: [])
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        var apiGetToken = URLComponents()
        apiGetToken.queryItems = [URLQueryItem(name: "username", value: username),
                                  URLQueryItem(name: "password", value: pasword),
                                  URLQueryItem(name: "grant_type", value: "password"),
                                  URLQueryItem(name: "scope", value: getscopeString()),
                                  URLQueryItem(name: "client_id", value: getprodClientID()),
                                  URLQueryItem(name: "response_type", value: "token id_token")]
        
        request.httpBody  = apiGetToken.query?.data(using: .utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, urlResponse, error) in
            if error != nil{
                completion(nil, true)
                return
            }
            do{
                if let data = data {
                    do{
                        let jsonDecoder = JSONDecoder()
                        let empData = try jsonDecoder.decode(ValidateUserGetTokenResponse.self, from: data)
                        completion(empData, true)
                    } catch{
                        completion(nil, false)
                    }
                }
            }
        }.resume()
    }
    
    
    // Refresh Token Api
    
    func apiRefreshToken(params: [String: String],refreshToken : String,  completion : @escaping (RefrehTokenResponse?, Bool) -> ()) {
        
        let Url = URL(string:"\(getloginSourceURl())")
        let result = getresourceID().merged(with: params)
        var request = URLRequest(url: Url!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: result, options: [])
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        var apiGetToken = URLComponents()
        apiGetToken.queryItems = [URLQueryItem(name: "grant_type", value: "refresh_token"),
                                  URLQueryItem(name: "response_type", value: "id_token"),
                                  URLQueryItem(name: "client_id", value: getprodClientID()),
                                  URLQueryItem(name: "resource", value: getprodClientID()),
                                  URLQueryItem(name: "refresh_token", value: refreshToken)]
        
        request.httpBody  = apiGetToken.query?.data(using: .utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, urlResponse, error) in
            if error != nil{
                completion(nil, true)
                return
            }
            do{
                if let data = data {
                    do{
                        let jsonDecoder = JSONDecoder()
                        let empData = try jsonDecoder.decode(RefrehTokenResponse.self, from: data)
                        completion(empData, true)
                    } catch{
                        completion(nil, false)
                    }
                }
            }
        }.resume()
    }
    
}


extension Dictionary {
    func merged(with another: [Key: Value]) -> [Key: Value] {
        var result = self
        for entry in another {
            result[entry.key] = entry.value
        }
        return result
    }
}
