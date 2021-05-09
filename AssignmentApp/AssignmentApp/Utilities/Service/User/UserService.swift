//
//  UserService.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation
struct UserServices {
    
    func fetchUserList(completionHandler:@escaping CompletionHandler) {
        NetworkManager.shared.performRequest(serviceType: .fetchUsers) { result in
            switch result {
            case .success(let response):
                do {
                    guard let data = response as? Data,let parser = try? [UserModel].decode(data: data) else {
                        completionHandler(.failure(NetworkError.parsingError))
                        return
                    }
                    completionHandler(.success(parser))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
