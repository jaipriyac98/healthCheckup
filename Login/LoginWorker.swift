//
//  RegisterWorker.swift
//  HealthCheckup
//
//  Created by MAC on 23/03/23.
//

import UIKit

class LoginWorker: NSObject {
    let networkLayer = NetworkLayerAlamofire()
    
    func LoginAPI(request: LoginModel.LoginData.Request, callBack: @escaping CompletionHandler) {
        let errorHandler: (String) -> Void = { (error) in
            callBack(statusCode.error, nil, error, ConstantAPINames.LoginApi.rawValue)
        }
        let successHandler: (LoginModel.LoginData.Response) -> Void = { (data) in
            callBack(statusCode.success, data, nil, ConstantAPINames.LoginApi.rawValue)
        }
       // guard let accessToken = UserDefaults.standard.value(forKey: UserDefauiltsKeys.k_UD_AccessToken) else {return}
        let urlString = ConstantAPINames.LoginApi.rawValue
        networkLayer.ServerCall(urlString: urlString, body: request, headers: ["Content-Type": "application/json"], successHandler: successHandler, errorHandler: errorHandler, method: .post)
}
}
