//
//  NetworkServiceStringPath.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation

extension NetworkService {
    
    func networkPath(path: String) -> String {
        return "\(baseConfig.baseUrl)\(path)"
    }
}
