//
//  BaseError.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Alamofire

struct BaseError {
    var errorMessage: String
    var statusCode: Int
    var debugMessage: String
    
    init(_ afError : AFError?) {
        debugMessage = afError.debugDescription
        statusCode = StatusCodes.afErrorNotFound(afError: afError)
        errorMessage = afError?.errorDescription ?? ""
    }
}

