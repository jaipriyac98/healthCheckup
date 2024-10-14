//
//  QuestionWorker.swift
//  HealthCheckup
//
//  Created by MAC on 28/03/23.
//

import UIKit

class QuestionWorker: NSObject {
    let networkLayer = NetworkLayerAlamofire()
    
    func QuestionApi(request: QuestionDetailsModel.GetQuestions.Request, callBack: @escaping CompletionHandler) {
        let errorHandler: (String) -> Void = { (error) in
            callBack(statusCode.error, nil, error, ConstantAPINames.QuestionApi.rawValue)
        }
        let successHandler: (QuestionDetailsModel.GetQuestions.Response) -> Void = { (data) in
            callBack(statusCode.success, data, nil, ConstantAPINames.QuestionApi.rawValue)
        }

        let urlString = ConstantAPINames.QuestionApi.rawValue
        networkLayer.ServerCall(urlString: urlString, body: request, headers: ["Content-Type": "application/json"], successHandler: successHandler, errorHandler: errorHandler, method: .get)
    }
}
