//
//  UserDetailTestCase.swift
//  AssignmentAppUITests
//
//  Created by Apple on 08/05/21.
//

import XCTest

@testable import AssignmentApp

class UserDetailTestCase: XCTestCase {

    private lazy var userViewModel: UserViewModel = {
        return UserViewModel()
    }()
    
      override func setUp() {
        super.setUp()
        let semaphore = DispatchSemaphore(value: 0)
          userViewModel.fetchUserListRequest { result in
            switch result {
            case .success(let success):
                self.userViewModel.setIsUserFavourite(index: 0, flag: true)
                XCTAssert(true, "\(success.debugDescription)")
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
            self.userViewModel.setIsUserFavourite(index: 0, flag: true)
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    //MARK:- UserViewModel Test Cases
    
    func testIsUserDataEmpty() {
        if userViewModel.getUserListCount() ?? 0 > 0 {
            XCTAssert(true, "Users Data is not empty")
        } else {
            XCTAssert(false, "Users Data is empty")
        }
    }
    
   func testUserName() {
        if userViewModel.getUserName(index: 0) != "" {
            XCTAssert(true, "User name is not empty")
        } else {
            XCTAssert(false, "User name is empty")
        }
    }
    
   func testName() {
        if userViewModel.getName(index: 0) != "" {
            XCTAssert(true, "Name is not empty")
        } else {
            XCTAssert(false, "Name is empty")
        }
    }
    
   func testUserPhone() {
        if userViewModel.getUserPhone(index: 0) != "" {
            XCTAssert(true, "Phone is not empty")
        } else {
            XCTAssert(false, "Phone is empty")
        }
    }
    
   func testUserWebsite() {
        if userViewModel.getUserWebsite(index: 0) != "" {
            XCTAssert(true, "Website is not empty")
        } else {
            XCTAssert(false, "Website is empty")
        }
    }
    
   func testUserStreet() {
        if userViewModel.getUserStreet(index: 0) != "" {
            XCTAssert(true, "Street name is not empty")
        } else {
            XCTAssert(false, "Street name is empty")
        }
    }
    
   func testUserSuite() {
        if userViewModel.getUserSuite(index: 0) != "" {
            XCTAssert(true, "Suite name is not empty")
        } else {
            XCTAssert(false, "Suite name is empty")
        }
    }
    
    func testUserCity() {
        if userViewModel.getUserCity(index: 0) != "" {
            XCTAssert(true, "City name is not empty")
        } else {
            XCTAssert(false, "City name is empty")
        }
    }
    
    func testUserZipcode() {
        if userViewModel.getUserZipcode(index: 0) != "" {
            XCTAssert(true, "Zipcode is not empty")
        } else {
            XCTAssert(false, "Zipcode is empty")
        }
    }
    
   func testUserLat() {
        if userViewModel.getUserlat(index: 0) != "" {
            XCTAssert(true, "Latitude is not empty")
        } else {
            XCTAssert(false, "Latitude is empty")
        }
    }
    
   func testUserlng() {
        if userViewModel.getUserlng(index: 0) != "" {
            XCTAssert(true, "Longitude is not empty")
        } else {
            XCTAssert(false, "Longitude is empty")
        }
    }
    
    func testCompanyName() {
        if userViewModel.getCompanyName(index: 0) != "" {
            XCTAssert(true, "Company name is not empty")
        } else {
            XCTAssert(false, "Company name is empty")
        }
    }
    
   func testCompanyCatchPhrase() {
        if userViewModel.getCompanyCatchPhrase(index: 0) != "" {
            XCTAssert(true, "Company Catch Phrase is not empty")
        } else {
            XCTAssert(false, "Company Catch Phrase is empty")
        }
    }
    
    func testCompanyBS() {
        if userViewModel.getCompanyBs(index: 0) != "" {
            XCTAssert(true, "Company BS is not empty")
        } else {
            XCTAssert(false, "Company BS is empty")
        }
    }
    
    func testIsSetFavourite() {
        if let testIsFav = userViewModel.isUserFavourite(index: 0), testIsFav {
            XCTAssert(true, "User in favourite list")
        }else {
            XCTAssert(false, "User not in favourite list")
        }
    }
    
    func testIsUserSectionDataEmpty() {
        if userViewModel.getUserSectionCount() ?? 0 > 0 {
            XCTAssert(true, "Users Section Data is not empty")
        } else {
            XCTAssert(false, "Users Section Data is empty")
        }
    }
    
    func testSectionTitle() {
        if userViewModel.getUserSectionTitle(index: 0) != "" {
            XCTAssert(true, "Section Title is not empty")
        } else {
            XCTAssert(false, "Section Title is empty")
        }
    }
    
}
