//
//  QuestionDetailsInteractor.swift
//  HealthCheckup
//
//  Created by MAC on 28/03/23.
//

import UIKit

protocol QuestionInteractorInput {
    func QuestionChoose(request: QuestionDetailsModel.GetQuestions.Request)
}


    
class QuestionDetailsInteractor: QuestionInteractorInput {
    

    
    var presenter: QuestionPresenterInput!
    var worker = QuestionWorker()
    
    func QuestionChoose(request: QuestionDetailsModel.GetQuestions.Request) {
        worker.QuestionApi(request: request) { (code, data, error, apiName)  in
            if let dataEncode: QuestionDetailsModel.GetQuestions.Response = data as? QuestionDetailsModel.GetQuestions.Response {
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
