//
//  StatusCode.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Alamofire

enum StatusCodes: Int {
    case notFound = 404
    case success = 200
    
    static func afErrorNotFound(afError: AFError?) -> Int {
        return afError?.responseCode ?? notFound.rawValue
    }
}

extension StatusCodes {
    
    static func isSuccess(val: Int) -> Bool {
        return  val == StatusCodes.success.rawValue
    }
}
