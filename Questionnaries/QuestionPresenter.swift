//
//  QuestionPresenter.swift
//  HealthCheckup
//
//  Created by MAC on 28/03/23.
//

import Foundation
protocol QuestionPresenterInput: GeneralOutputMethods {}
protocol QuestionPresenterOutput: GeneralDisplayMethods {}

class QuestionPresenter: QuestionPresenterInput {
    var outputVC: QuestionPresenterOutput!

    func presentSuccess<T: Encodable>(data: T, success: Bool?, apiName: String) {
      //  outputVC.displaySuccess(data: data, success: success, apiName: apiName)
    }
    func presentError(errorMessage: String?, apiName: String) {
      //  outputVC.displayError(errorMessage: errorMessage, apiName: apiName)
    }
}
