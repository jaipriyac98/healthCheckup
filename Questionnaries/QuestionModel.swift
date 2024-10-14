//
//  QuestionModel.swift
//  HealthCheckup
//
//  Created by MAC on 28/03/23.
//

import Foundation


enum QuestionDetailsModel {
    enum GetQuestions {
        struct Request : Codable {
            }
        struct Response: Codable {
            let questions: [Question]
        }
        struct Question: Codable {
            let id, question: String
            let choices: [String]
        }
    }
}

