//
//  BaseResponse.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}

