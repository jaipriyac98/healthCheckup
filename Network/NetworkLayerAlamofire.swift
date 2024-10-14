import Foundation
//import Alamofire
import UIKit

public typealias ErrorHandlerAlamofire = (String) -> Void
let requestTimeOut: TimeInterval = 60

enum HTTPMethod {
    case post
    case get
    case delete
    case put
}

// MARK: - NetworkLayerAlamofire
open class NetworkLayerAlamofire {

    public init() {
    }

    private func WebseviceCall<T: Encodable, F: Decodable>(urlString: String, headers: [String: String] = [:], body: T, successHandler: @escaping (F) -> Void, errorHandler: @escaping ErrorHandlerAlamofire, method: HTTPMethod) {
        let  finalEndpoint = getBaseUrl() + urlString
        if let urlReq = URL(string: finalEndpoint) {
                var request = URLRequest(url: urlReq)
                switch method {
                case .post:
                    request.httpMethod = "POST"
                case .get:
                    request.httpMethod = "GET"
                case .put:
                    request.httpMethod = "PUT"
                case .delete:
                    request.httpMethod = "DELETE"
//                default:
//                    request.httpMethod = ""
                }
                let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(body), method != .get {
                    request.httpBody = encoded
                }

                    for model in headers {
                        request.setValue(model.value, forHTTPHeaderField: model.key)
                    }
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in

                        guard let data = data, error == nil else {
                            errorHandler(GenericError)
                            return
                        }
                        
                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200, httpStatus.statusCode != 201 {
                            // 1. Check Invalid token
                                if httpStatus.statusCode == 401 {
//                                    AzureSignUpManager.shared.acquireTokenSilently()
                                    errorHandler(TokenExpired)
                                    return
                                }

                            // Else 2. Check Any error Msgs present
                            do {
                                let responseObject = try JSONDecoder().decode(ErrorData.self, from: data)
                                if let jsonString = String(data: data, encoding: .utf8) {
                                }
                                if let msgObj = responseObject.error?.message {
                                    return errorHandler(msgObj)
                                }
                                if let titleObj = responseObject.title {
                                    return errorHandler(titleObj)
                                }
                            }
                            catch {
                                print(error)
                            }

                            // Else 3. Send Generic Msg
                            if httpStatus.statusCode == 500 {
                                if let jsonString = String(data: data, encoding: .utf8) {
                                    print(jsonString)
                                }
                                errorHandler(GenericError)
                                return
                            }
                        }
                        do {
                            let responseObject = try JSONDecoder().decode(F.self, from: data)
                            if let jsonString = String(data: data, encoding: .utf8) {
                            }
                            successHandler(responseObject)
                            return
                        }
                        
                        catch {
                            print(error)
                          return errorHandler(self.errorForParsingIssue(actualError: urlString + error.localizedDescription) )
                        }
                    }
                    task.resume()
             }
       }

    // MARK: - POST
    func ServerCall<T: Encodable, F: Decodable>(
        urlString: String,
        body: T,
        headers: [String: String] = [:],
        successHandler: @escaping (F) -> Void,
        errorHandler: @escaping ErrorHandlerAlamofire,
        method: HTTPMethod) {
        // *********** NETWORK CONNECTION
        if !NetworkRechability.isConnectedToNetwork() {
            errorHandler(internetConnectionError)
            return
        }
        WebseviceCall(urlString: urlString, headers: headers, body: body, successHandler: successHandler, errorHandler: errorHandler, method: method)
            
    }
}

// MARK: - Helper Methods
extension NetworkLayerAlamofire {
    // MARK: - SUCCESS
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        // return statusCode >= 200 && statusCode < 300
        return statusCode == 200
    }

    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }

    private func isSuccessWithErrorCode(_ statusCode: Int) -> Bool {
        return statusCode >= 400 && statusCode <= 500 || statusCode == 422
    }

    private func isSuccessWithErrorCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessWithErrorCode(urlResponse.statusCode)
    }
}

// MARK: - ServerUnderMaintenance
extension NetworkLayerAlamofire {
    private func isUserServerUnderMaintenance(_ statusCode: Int) -> Bool {
        return statusCode == 503 || statusCode == 502
    }

    private func isUserServerUnderMaintenanceCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isUserServerUnderMaintenance(urlResponse.statusCode)
    }
}

// MARK: - Authorization
extension NetworkLayerAlamofire {
    private func isUserAuthorizedSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode == 401 || statusCode == 403
    }

    private func isUserAuthorizedSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isUserAuthorizedSuccessCode(urlResponse.statusCode)
    }
}

// MARK: -
extension NetworkLayerAlamofire {
    // MARK: - CREATE URL
    private func createBaseUrl(endPoint: String) -> String {
        var  finalEndpoint = getBaseUrl() + endPoint
        #if DEBUG
        print("Final EndPoint \(finalEndpoint)")
        #elseif STAGE
        print("Final EndPoint \(finalEndpoint)")
        #endif
        return finalEndpoint
    }
    // MARK: - Error Handling Incase of Parsing issue
    private func errorForParsingIssue(actualError: String) -> String {
        var  genericError = GenericError
        #if DEBUG
        genericError = actualError

        #elseif STAGE
        genericError = actualError

        #endif
        return genericError
    }

}
