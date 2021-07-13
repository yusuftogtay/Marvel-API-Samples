//
//  INetworkService.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation

import Alamofire
protocol INetworkService {
    func fetch<T>(path: String, paramaters: [String: String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
}

