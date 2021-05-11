//
//  UserResponseModel.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation

// MARK: - UserModel
struct UserModel:Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    var isFavourate = false
    
    enum CodingKeys: String,CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
            self.id = id
        }
        
        if let name = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
        
        if let username = try container.decodeIfPresent(String.self, forKey: .username) {
            self.username = username
        }
        
        if let email = try container.decodeIfPresent(String.self, forKey: .email) {
            self.email = email
        }
        
        if let address = try container.decodeIfPresent(Address.self, forKey: .address) {
            self.address = address
        }
        
        if let phone = try container.decodeIfPresent(String.self, forKey: .phone) {
            self.phone = phone
        }
        
        if let website = try container.decodeIfPresent(String.self, forKey: .website) {
            self.website = website
        }
        
        if let company = try container.decodeIfPresent(Company.self, forKey: .company) {
            self.company = company
        }
    }
}

// MARK: - Address
struct Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    enum CodingKeys: String,CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        if let street = try container.decodeIfPresent(String.self, forKey: .street) {
            self.street = street
        }
        
        if let suite = try container.decodeIfPresent(String.self, forKey: .suite) {
            self.suite = suite
        }
        
        if let city = try container.decodeIfPresent(String.self, forKey: .city) {
            self.city = city
        }
        
        if let zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode) {
            self.zipcode = zipcode
        }
        
        if let geo = try container.decodeIfPresent(Geo.self, forKey: .geo) {
            self.geo = geo
        }
        
    }
}

// MARK: - Geo
struct Geo: Codable {
    var lat: String?
    var lng: String?
    
    enum CodingKeys: String,CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let lat = try container.decodeIfPresent(String.self, forKey: .lat) {
            self.lat = lat
        }
        
        if let lng = try container.decodeIfPresent(String.self, forKey: .lng) {
            self.lng = lng
        }
        
    }
}

// MARK: - Company
struct Company: Codable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    enum CodingKeys: String,CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let name = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
        
        if let catchPhrase = try container.decodeIfPresent(String.self, forKey: .catchPhrase) {
            self.catchPhrase = catchPhrase
        }
        
        if let bs = try container.decodeIfPresent(String.self, forKey: .bs) {
            self.bs = bs
        }
    }
    
}
