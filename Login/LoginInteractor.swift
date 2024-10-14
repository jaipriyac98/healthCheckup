//
//  RegisterInteractor.swift
//  HealthCheckup
//
//  Created by MAC on 23/03/23.
//

import Foundation

protocol LoginInteractorInput {
    func LoginUser(request: LoginModel.LoginData.Request)
  
    
 
    
}

class LoginInteractor: LoginInteractorInput {

    var presenter: LoginPresenterInput!
    var worker = LoginWorker()

    
func LoginUser(request: LoginModel.LoginData.Request) {
    worker.LoginAPI(request: request) { (code, data, error, apiName)  in
        if let dataEncode: LoginModel.LoginData.Response = data as? LoginModel.LoginData.Response {
            if code == statusCode.success {
               
                self.presenter.presentSuccess(data: dataEncode, success: true, apiName: apiName)
                print("success")
                print(dataEncode)
                return
            }
        }
        self.presenter.presentError(errorMessage: error, apiName: apiName)
        print("fail")
    }
}
}
