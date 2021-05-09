//
//  NetworkApis.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation

enum  NetworkApis {
    
    fileprivate var networkEnvironment:NetworkEnvironment {
        return .development
    }
    
    fileprivate var baseURL:String {
        switch  networkEnvironment {
        case .development:
            return "https://jsonplaceholder.typicode.com"
        }
    }
    
    //Get methods
    case fetchUsers
    
}

extension NetworkApis {
    var path :String {
        var servicePath = ""
        switch self  {
        case  .fetchUsers:
            servicePath = "/users"

        }
        
        return baseURL + servicePath
    }
    
    var parameters: anyDict? {
        switch self  {
        default:
            return nil
        }
    }
    
    var headers: anyDictString? {
        var dict = anyDictString()
        switch self {
            default:
            dict = ["Content-Type":"application/json"]
        }
        return dict
    }
    
    var method: HTTPMethod {
        switch self  {
        case  .fetchUsers:
            return .get
    
        }
    }
    
    var getNetworkEnvironment: String {
        return networkEnvironment.rawValue
    }
    
}
