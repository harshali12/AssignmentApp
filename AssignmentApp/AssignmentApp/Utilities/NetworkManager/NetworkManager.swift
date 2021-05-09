//
//  NetworkManager.swift
//  HangamaApp
//
//  Created by webwerks on 06/05/21.
//

import Foundation
class NetworkManager: NSObject, URLSessionDelegate {
    
    static var shared = NetworkManager()
    
    private override init() {
        
    }
    
    func performRequest(serviceType:NetworkApis, completionHandler:@escaping CompletionHandler) {
        
        print("URL -> \(serviceType.path)\n Parameters -> \(String(describing: serviceType.parameters))\n Headers -> \(String(describing: serviceType.headers))")
        
        var request = URLRequest(url: URL(string:serviceType.path)!)
        request.httpMethod = serviceType.method.rawValue
        
        if let param = serviceType.parameters {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {
                return
            }
            request.httpBody = httpBody
        }
        request.allHTTPHeaderFields = serviceType.headers
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: request) { (data, response, error) in
//            let message = error?.localizedDescription ?? "ErrorMessages.serverError"
            if let responseVal = response as? HTTPURLResponse, let responseData = data {
                print("Response -> \(String(describing: String(data: responseData, encoding: .utf8)))")
                switch responseVal.statusCode {
                case HTTPErrorCodes.SuccessCodeMin.rawValue...HTTPErrorCodes.SuccessCodeMax.rawValue:
                    completionHandler(.success(responseData))
                    return
                default:
                    break
                }
            }
            if let err = error {
                completionHandler(.failure(err))
            }
        }
        task.resume()
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        
    }
    
}


