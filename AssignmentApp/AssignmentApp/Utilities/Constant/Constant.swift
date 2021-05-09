//
//  AlertMessageConstant.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation

enum AlertMessage:String {
    case kSomethingWentWrong = "Something Went Wrong"
}

enum ScreenName: String {
    case kUserDetailsVC = "UserDetailsViewController"
}

enum ScreenText: String {
    case kName = "Name: "
    case kPhone = "Phone: "
    case kWebsite = "Website: "
    case kCompanyName = "Company Name: "
    case kStreet = "Street: "
    case kSuite = "Suite: "
    case kCity = "City: "
    case kZipcode = "Zipcode: "
    case kLat = "Latitude: "
    case kLng = "Longitude: "
    case kPharse = "Catch Phrase: "
    case kBs = "bs: "
}

enum NetworkError: Error {
    case parsingError
    var localizedDescription: String {
        switch self {
        case .parsingError:
            return NSLocalizedString(AlertMessage.kSomethingWentWrong.rawValue, comment: "")
        }
    }
}
