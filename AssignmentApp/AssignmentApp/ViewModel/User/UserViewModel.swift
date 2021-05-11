//
//  UserViewModel.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation

class UserViewModel: NSObject {
    
    lazy var service: UserServices = {
        return UserServices()
    }()
    
    private lazy var userList = [UserModel]()
    private var userSections: [UserDetailsSection] {
        return [.name,.addressDetails,.companyDetails,.phone,.website]
    }
    
}

// MARK: - API Calls
extension UserViewModel {
    func fetchUserListRequest(completion: @escaping CompletionHandler) {
        service.fetchUserList { result in
            switch result {
            case .success(let response):
                if let usersList = response as? [UserModel]  {
                    self.userList = usersList
                }
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//MARK:- Data Operation
extension UserViewModel {
    func getUserListCount() -> Int? {
        userList.count
    }
    
    func getUserName(index: Int) -> String? {
        return userList[index].username
    }
    
    func getName(index: Int) -> String? {
        return userList[index].name
    }
    
    func getUserPhone(index: Int) -> String? {
        return userList[index].phone
    }
    
    func getUserWebsite(index: Int) -> String? {
        return userList[index].website
    }
    
    func isUserFavourite(index: Int) -> Bool? {
        return userList[index].isFavourate
    }
    
    func setIsUserFavourite(index: Int, flag: Bool) {
        userList[index].isFavourate = flag
    }
    
    func getUserStreet(index: Int) -> String? {
        return userList[index].address?.street
    }
    
    func getUserSuite(index: Int) -> String? {
        return userList[index].address?.suite
    }
    
    func getUserCity(index: Int) -> String? {
        return userList[index].address?.city
    }
    
    func getUserZipcode(index: Int) -> String? {
        return userList[index].address?.zipcode
    }
    
    func getUserlat(index: Int) -> String? {
        return userList[index].address?.geo?.lat
    }
    
    func getUserlng(index: Int) -> String? {
        return userList[index].address?.geo?.lng
    }
    
    func getCompanyName(index: Int) -> String? {
        return userList[index].company?.name
    }
    
    func getCompanyCatchPhrase(index: Int) -> String? {
        return userList[index].company?.catchPhrase
    }
    
    func getCompanyBs(index: Int) -> String? {
        return userList[index].company?.bs 
    }
    
    func getUserSectionCount() -> Int? {
        return userSections.count
    }
    
    func getUserSectionTitle(index: Int) -> String? {
        return userSections[index].rawValue
    }
    
}
