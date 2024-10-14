//
//  RegisterPresenter.swift
//  HealthCheckup
//
//  Created by MAC on 23/03/23.
//

import UIKit

protocol LoginPresenterInput: GeneralOutputMethods {}

protocol LoginPresenterOutput: GeneralDisplayMethods {}

class LoginPresenter: LoginPresenterInput {
    var outputVC: LoginPresenterOutput!

    func presentSuccess<T: Encodable>(data: T, success: Bool?, apiName: String) {
      //  outputVC.displaySuccess(data: data, success: success, apiName: apiName)
    }
    func presentError(errorMessage: String?, apiName: String) {
      //  outputVC.displayError(errorMessage: errorMessage, apiName: apiName)
    }
}
