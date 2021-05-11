//
//  ConstantAlices.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import Foundation
public  typealias anyDict = [String:Any]
public  typealias anyDictArray = [String : anyDict]
public  typealias anyDictString = [String : String]
public typealias  anyParam = Any

typealias CompletionHandler = (Result<Any?, Error>) -> ()
typealias Completion = (Bool,String) -> ()
