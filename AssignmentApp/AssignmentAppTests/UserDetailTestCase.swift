//
//  UserDetailTestCase.swift
//  AssignmentAppUITests
//
//  Created by Apple on 08/05/21.
//

import XCTest

@testable import AssignmentApp

class UserDetailTestCase: XCTestCase {

     private var userViewModel: UserViewModel!

      override func setUp() {
        super.setUp()
        userViewModel = UserViewModel()
      }

    func testFetchService() {
        userViewModel.fetchUserListRequest { result in
            switch result {
            case .success(_):
                XCTAssert(true, "Data fetch successfully")
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    func testIsUserModelValidate() {
        userViewModel.fetchUserListRequest { result in
            switch result {
            case .success(let response):
                guard let _ = response as? [UserModel] else {
                    XCTAssert(false, "Model Not Validate Successfully.")
                    return
                }
                XCTAssert(true, "Model Validate successfully")
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    
}
