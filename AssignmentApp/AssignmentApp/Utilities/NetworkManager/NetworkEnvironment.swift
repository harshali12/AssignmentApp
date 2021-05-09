//
//  NetworkEnvironment.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//


import Foundation
enum NetworkEnvironment:String {
    case development = "development"
}

enum HTTPErrorCodes:Int {
    case SuccessCodeMin = 200
    case SuccessCodeMax = 500
}

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

